require 'takeway'
describe Takeway do
  describe '#read' do
    it 'has method' do
      is_expected.to respond_to(:read)
    end
  end
end
