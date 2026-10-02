require 'yaml'
require 'rspec'
require 'selenium-webdriver'

require 'rbconfig'

# CONFIG_NAME picks config/<name>.config.yml. When it isn't set (e.g. the hybrid
# YAML, where ${matrix.os} isn't expanded inside env), use the runner's own OS.
CONFIG_NAME = if ENV['CONFIG_NAME'].to_s =~ /\A\w+\z/
                ENV['CONFIG_NAME']
              else
                case RbConfig::CONFIG['host_os']
                when /mswin|mingw|cygwin/ then 'win'
                when /darwin/ then 'mac'
                else 'linux'
                end
              end

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../config/#{CONFIG_NAME}.config.yml")))
CONFIG['user'] = ENV['LT_USERNAME'] || CONFIG['user']
CONFIG['key'] = ENV['LT_ACCESS_KEY'] || CONFIG['key']

RSpec.configure do |config|
  config.around(:example) do |example|
    # Get browser configuration
    browser_config = CONFIG['browser_caps'][0]
    browser_name = browser_config['browserName'] || 'chrome'
    
    # Create browser-specific options using Selenium 4 approach
    options = case browser_name.downcase
              when 'chrome'
                Selenium::WebDriver::Chrome::Options.new
              when 'firefox'
                Selenium::WebDriver::Firefox::Options.new
              when 'edge', 'microsoftedge'
                Selenium::WebDriver::Edge::Options.new
              when 'safari'
                Selenium::WebDriver::Safari::Options.new
              else
                Selenium::WebDriver::Chrome::Options.new
              end

    # Disable Chrome's password manager / leak-detection bubble, which pops up
    # after a successful login with a known-breached password and breaks the test
    if options.is_a?(Selenium::WebDriver::Chrome::Options)
      options.add_preference('credentials_enable_service', false)
      options.add_preference('profile.password_manager_enabled', false)
      options.add_preference('profile.password_manager_leak_detection', false)
      options.add_argument('--disable-features=PasswordLeakDetection')
    end

    # Build LT:Options from config
    lt_options = CONFIG['common_caps'].merge(browser_config['LT:Options'] || {})
    lt_options['name'] = ENV['name'] || example.metadata[:name] || example.metadata[:file_path].split('/').last.split('.').first

    # Set LambdaTest options capability
    options.add_option('LT:Options', lt_options)
    
    # Set browser version and platform if specified
    options.browser_version = browser_config['browserVersion'] if browser_config['browserVersion']
    options.platform_name = browser_config['platformName'] if browser_config['platformName']

    # Create remote WebDriver using capabilities array (Selenium 4 way)
    @driver = Selenium::WebDriver.for(
      :remote,
      url: "https://#{CONFIG['user']}:#{CONFIG['key']}@#{CONFIG['server']}/wd/hub",
      capabilities: [options]
    )
    @wait = Selenium::WebDriver::Wait.new(timeout: 30)
    
    begin
      example.run
    ensure
      retry_count = 1
      begin
        @driver.quit
      rescue Selenium::WebDriver::Error::WebDriverError => e
        retry_count -= 1
        if retry_count.zero?
          # puts "Failed to quit WebDriver session: #{e.message}"
        else
          sleep 1
          retry
        end
      end
    end
  end
end
