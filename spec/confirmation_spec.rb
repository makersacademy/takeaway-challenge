require 'confirmation'

describe Confirmation do
  let(:messages) { spy :messages}
  let(:client) { double :client, messages: messages}
  let(:env) { { 
      'TWILIO_ACCOUNT_SID' => '123',
      'TWILIO_AUTH_TOKEN' => '321',
      } }
  let(:message_contents) { { 
    body: "Thank you! Your order was placed and will be delivered shortly.",
    from: nil,
    to: nil
   } }
  let(:confirmation) { Confirmation.new(env, client) }
  let(:body) { "test" }
  
  it { is_expected.to respond_to(:send_message) }

  it 'creates a new message' do  
    confirmation.send_message
    expect(messages).to have_received(:create).with(message_contents)
  end

end