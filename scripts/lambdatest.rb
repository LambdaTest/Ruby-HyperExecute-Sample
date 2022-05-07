require 'yaml'
require 'rspec'
require 'selenium-webdriver'

CONFIG_NAME = ENV['CONFIG_NAME']

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../config/#{CONFIG_NAME}.config.yml")))
CONFIG['user'] = ENV['LT_USERNAME'] || CONFIG['user']
CONFIG['key'] = ENV['LT_ACCESS_KEY'] || CONFIG['key']

RSpec.configure do |config|
  config.around(:example) do |example|
    @caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][0])
    @caps["name"] = ENV['name'] || example.metadata[:name] || example.metadata[:file_path].split('/').last.split('.').first

    @driver = Selenium::WebDriver.for(:remote,:url => "https://#{CONFIG['user']}:#{CONFIG['key']}@#{CONFIG['server']}/wd/hub",:capabilities => @caps)
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
    begin
      example.run
    ensure
      @driver.quit
    end
  end
end
