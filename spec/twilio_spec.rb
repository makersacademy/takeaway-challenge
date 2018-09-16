require "./lib/twilio.rb"

describe Twilio do
  describe '#send_message' do
    it 'sends a message to number given' do
      allow(subject).to receive(:send_message).with("123456").and_return("Your order was successful")
      expect(subject.send_message("123456")).to eq("Your order was successful")
    end
  end
end