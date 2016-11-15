require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'allure-cucumber'
require 'fileutils'

include AllureCucumber::DSL

Before do
  @current_page = HomePage.new
end

After do |scenario|
  scenario = scenario.scenario_outline if scenario.respond_to?('scenario_outline')
  ss_dir = "#{File.expand_path("./")}/screenshots"
  FileUtils.mkdir_p "#{ss_dir}"
  ss = DateTime.now.strftime("%d%b%Y%H%M%S")

  if scenario.failed?
    @current_page.save_screenshot "#{ss_dir}/#{ss}.png"
    attach_file("screenshot-#{ss}", File.open("#{ss_dir}/#{ss}.png"))
  end
end
