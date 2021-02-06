require 'sms_sender'

describe SmsSender do
  describe '#initialize' do
    let(:sms_sender) { double :sms_sender, expected_time: "2021-02-06 01:05:06.543316000 +0000" }
    it 'generates an estimated time 1 hour from order being placed' do
      expect(sms_sender.expected_time).to eq "2021-02-06 01:05:06.543316000 +0000"
    end
  end

  describe '#send' do
    let(:sms_sender) { double :sms_sender, send: "Thank you! Your order was placed and will be delivered before 01:04 AM" }
    it 'sends sms confirmation to customer when order placed' do
      expect(sms_sender.send).to eq "Thank you! Your order was placed and will be delivered before 01:04 AM"
    end
  end
end
