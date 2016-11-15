Given /^I am a web app user$/ do
  # initializes our first page object
  # and gets us the @current_page instance variable
  @current_page.load
end

Then /^I am on the (.*) (?:Page|page)$/ do |name_of_page|
    new_page = @current_page.class_for(name_of_page)
    @current_page = new_page.new
    puts "@current_page #{@current_page}"
    expect(@current_page.url).to include @current_page.page_url
end

And /^I click the (.*) link$/ do |link_name|
  link = link_name.gsub(" ", "_") + "_link"
  @current_page.send(link).click
end

And /^I click the (.*) button$/ do |button_name|
  button = button_name.gsub(" ", "_") + "_button"
  @current_page.send(button).click
end

Then /^the (.*) button is visible$/ do |button_name|
  button = button_name.gsub(" ", "_")
  expect(@current_page.send(button)).to be_truthy
end

Then /^the error message contains "(.*)"$/ do |error_message|
  expect(@current_page.flash_error.text).to include error_message
end
