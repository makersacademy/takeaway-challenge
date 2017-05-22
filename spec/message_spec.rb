require 'message'

describe Message do
  subject(:message) { described_class.new }

  describe '#send_message' do
    it 'calculates the expected arrival time of order (+ 30 minutes)' do
      time2 = Time.now + (30 * 60)
      message.send_message(20)
      expect(message.time_order).to eq time2.strftime("%H:%M")
    end
  end
end
