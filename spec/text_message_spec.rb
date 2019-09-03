require 'text_message'
require 'sms'
describe TextMessage do
  subject(:text) { described_class.new }

  describe '#send_text' do
    it "sends a text message to user" do
      expect { text.send_text }.
      to output("Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.strftime('%M')}").to_stdout
    end
  end

  describe '#sms_send' do
    it "should send a text to a number" do
      allow(text).to receive(:sms_send) { true }
      expect(text.sms_send).to be_truthy
    end
  end
end
