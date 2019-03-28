require 'messenger'

describe Messenger do
  it 'initialises with correct attributes' do
    subject = Messenger.new()
    expect(subject.account_sid).to eq(ENV["TWILIO_ACCOUNT_SID"])
    expect(subject.auth_token).to eq(ENV["TWILIO_AUTH_TOKEN"])
  end
end
