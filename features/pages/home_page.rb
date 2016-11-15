class HomePage < CommonPage

  set_url "/"

  element :form_authentication_link, "a[href='/login']"

  def page_url
    "/"
  end
end
