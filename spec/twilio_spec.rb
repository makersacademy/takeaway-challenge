require 'twilio'

describe TwilioAPI do
  describe '#send_sms' do
    it 'sends sms comfirmation of customer order' do
      client = double :client
      allow(client).to receive_message_chain(:messages, :create)
      expect(Twilio::REST::Client).to receive(:new).and_return(client)
      subject.send_sms('foo')
    end
  end

  # describe '#payment_confirmation' do
  #   it 'should return comfirmation message' do
  #     time = Time.now + 3600
  #     expect(subject.payment_confirmation(21.99)).to eq(
  #     "Thanks for your order of £21.99 on #{time.strftime("%d/%m/%y")}:"\
  #     "Your order is scheduled to arrive at #{time.strftime("%H:%M")}.")
  #   end
  # end
end
