def test_sign_in(user)
  controller.sign_in(user)
end

def sign_in(provider)
  visit root_path
  click_link(provider)
end

