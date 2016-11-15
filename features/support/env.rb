require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec/expectations'
require 'rspec/matchers'
require 'allure-cucumber'

include AllureCucumber::DSL

AllureCucumber.configure do |config|
  config.output_dir = 'allure'
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = 'https://the-internet.herokuapp.com'
end
