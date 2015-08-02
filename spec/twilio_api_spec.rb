require 'twilio_api'

describe TwilioAPI do
  describe '#text_message' do
    it 'should receive payment_message' do
      expect(subject).to respond_to(:text_message)
    end
  end

  describe '#payment_message' do
    it 'should return the correct message' do
      time = Time.new + 3600
      expect(subject.payment_message(8.5)).to eq 'Thank you! Your order of '\
      "£8.5 was placed and will be delivered before #{time.strftime("%H:%M")}"
    end
  end
end
