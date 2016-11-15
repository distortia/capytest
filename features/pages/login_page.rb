class LoginPage < CommonPage
  set_url "/login"

  element :login_button, "button", :text => "Login"

  def page_url
    "/login"
  end

end
