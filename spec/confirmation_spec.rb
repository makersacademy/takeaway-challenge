require 'confirmation'

describe Confirmation do
  let(:confirmation) { Confirmation.new }

  describe '#time' do
    it 'tells me the time that my order was placed' do
      time = Time.new
      expect(confirmation.time). to eq time.strftime("%k:%M")
    end
  end
end
