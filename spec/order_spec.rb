require 'order'

describe Order do
  subject(:order) { described_class.new }

  describe '#initialize' do 
    it 'initializes with an empty array of items' do 
      expect(order.items).to match_array([])
    end
  end
end
