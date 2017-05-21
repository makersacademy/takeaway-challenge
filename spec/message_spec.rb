require 'message'

describe Message do
  subject(:message) { described_class.new }

  describe '#send_message' do
    it 'calculates the expected arrival time of order (+ 30 minutes)' do
      time2 = Time.now + (30 * 60)
      time_future = "#{time2.hour}:#{time2.min}"
      message.send_message(20)
      expect(message.time_order).to eq time_future
    end
  end
end
