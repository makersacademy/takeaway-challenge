require 'confirmation'

describe Confirmation do
  let(:confirmation) { Confirmation.new }

  describe '#time' do
    it 'tells me the time that my order was placed' do
      time = Time.new + 3600
      expect(confirmation.time). to eq time.strftime("%k:%M")
    end
  end
  describe '#send_message' do
    it 'receives the send_message method' do
      expect(confirmation).to receive(:send_message)
    end
  end
end
