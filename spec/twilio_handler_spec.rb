require 'twilio_handler'

describe TwilioHandler do

  it 'responds to ".send_message"' do
    expect(described_class).to respond_to(:send_message)
  end

end
