require 'sms'

describe Sms do

  subject(:text) { described_class.new }

  describe '#send_confirmation_message' do
    it 'writes a message' do
      phone_number, order_number, total_cost = ["REDACTED", 11, 5.99]
      hour = Time.now.hour == 23 ? "00" : (Time.now.hour + 1).to_s
      minute = Time.now.min < 10 ? "0" + Time.now.min.to_s : Time.now.min
      message = "Makeroo here. Just to confirm, you've placed order ##{order_number}, for #{total_cost}. It'll be with you by #{hour}:#{minute}."
      allow(text).to receive(:send) { "#{message}" }
      expect(text.send_confirmation_message(phone_number, order_number, total_cost)).to eql message
    end
  end
end
