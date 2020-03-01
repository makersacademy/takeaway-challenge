require 'fake_sms'

describe FakeSms do

  subject(:fake_sms) { described_class.new }

  it 'sends a text message via the Twilio API after a notication is created' do
    expect(fake_sms.send_sms "1234567890", "Hi!").to eq "Hi! was sent to 1234567890"
  end

end
