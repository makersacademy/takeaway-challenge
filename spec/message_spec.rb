require 'message'

describe Message do
  subject(:message) { described_class.new }

  describe '#send_message' do
    it 'calculates the expected arrival time of order (+ 30 minutes)' do
      time_now = "#{Time.now.hour}:#{Time.now.min}"
      message.send_message(20)
      expect(message.time).to eq "#{Time.now.hour}:#{Time.now.min + 30}"
    end
  end
end
