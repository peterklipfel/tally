module FeatureSpecHelpers
  def sign_up_user
    visit new_user_registration_path
    fill_in "user_email", with: "yooser@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_on "Sign Up"
  end
end