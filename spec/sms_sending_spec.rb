require 'sms_sending'

feature "signing in" do
  scenario "with two factors" do
    user = create(:user, password: "password", email: "user@example.com")

    visit root_path
    click_on "Sign In"

    fill_in :email, with: "user@example.com"
    fill_in :password, with: "password"
    click_on "Submit"

    last_message = FakeSMS.messages.last # this now returns a message object
    fill_in :code, with: last_message.body # the code is the body of the message
    click_on "Submit"

    expect(page).to have_content("Sign out")
  end
end
