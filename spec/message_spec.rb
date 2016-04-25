require 'message'

describe Message do

  subject(:message) { described_class.new }
  let (:message_body) { "Thank you for the order! It will be de delivered by #{Time.new.hour + 1}:#{Time.new.min}" }
  describe '#send_sms' do
    it "sends the text" do
      allow(message).to receive(:send_sms).with(anything).and_return('sms')
    end
  end
end
