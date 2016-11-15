class CommonPage < SitePrism::Page
	include Capybara::DSL
  include RSpec::Matchers

	element :fork_me_on_github, "img[alt='Fork me on GitHub']"
	element :flash_error, "div.flash.error"

	# Returns `about us` as `AboutUsPage`
	def class_for(page)
     page = page.split
     page.each do |fragment|
       fragment[0] = fragment[0].capitalize!
     end
     page = page.join
     Object.const_get(page + 'Page')
   end
end
