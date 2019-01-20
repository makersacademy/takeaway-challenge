require 'text'

RSpec.describe Text do
  let(:twilio_class) { class_double('Twilio::REST::Client') }
  let(:twilio_instance) { instance_double('Twilio::REST::Client') }
  let(:twillio_message_instance) { double('TwilioMessageInstance') }
  let(:text) { Text.new({ client: twilio_class, name: 'takeaway', number: '+4412345678', sid: 'abc', token: 'abc' }) }

  subject { text }

  it 'accepts a hash as arguments' do
    is_expected.to respond_to(:send_confirmation).with(1).argument
  end

  it 'returns error code 0 on sending a text' do
    allow(twilio_class).to receive(:new).and_return(twilio_instance)
    allow(twilio_instance).to receive_message_chain(:messages, :create).and_return(twillio_message_instance)
    allow(twillio_message_instance).to receive(:error_code).and_return(0)
    expect(text.send_confirmation('+4412345678')).to have_attributes(:error_code => 0)
  end

end
