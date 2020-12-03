require 'confirmation'

describe Confirmation do
  let(:messages) { spy :messages }
  let(:client) { double :client, messages: messages }
  let(:time) { double :time, now: estimated_time }
  let(:estimated_time) { double :time, hour: 12, min: 15 }
  let(:env) { { 
      'TWILIO_ACCOUNT_SID' => '123',
      'TWILIO_AUTH_TOKEN' => '321',
      } 
  }
  let(:message_contents) { 
    { body: "Thank you! Your order was placed and will be delivered before 13:15.",
    from: nil,
    to: nil } 
  }
  let(:confirmation) { Confirmation.new(env, client) }
  let(:body) { "test" }
  
  it { is_expected.to respond_to(:send_message) }

  it 'creates a new message' do  
    confirmation.send_message(time)
    expect(messages).to have_received(:create).with(message_contents)
  end

  describe '#eta' do
    it { is_expected.to respond_to(:eta) }

    it 'returns current time + 1 hour' do
      expect(confirmation.eta(time)).to eq("13:15")
    end
  end

end
