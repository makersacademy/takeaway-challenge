require 'twilio_client'

describe TwilioClient do

  subject(:client) {described_class.new}

  it '.notify' do
    expect(client).to respond_to(:notify).with(1).argument
  end

end
