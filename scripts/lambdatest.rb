require 'yaml'
require 'rspec'
require 'selenium-webdriver'

CONFIG_NAME = ENV['CONFIG_NAME']

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
    @wait = Selenium::WebDriver::Wait.new(timeout: 15)
    
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
