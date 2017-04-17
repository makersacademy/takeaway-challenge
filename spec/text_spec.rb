require 'text'

describe Text do
  let (:client) {client = Twilio::REST::Client.new account_sid, auth_token}

  it "sends a text message when called" do
    Text.make_text('+447950453738', "hello!")
  end

end
