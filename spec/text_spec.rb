require 'text'


describe Text do
  subject(:text) {described_class.new}

  it {is_expected.to respond_to(:send)}

  it 'sends a text message to confirm a succesful order' do
    text.send("+15005550006", ENV["TEST_TWILIO_ACCOUNT_SID"],
    ENV["TEST_TWILIO_AUTH_TOKEN"])
    expect(text.message).not_to eq nil
  end
end
