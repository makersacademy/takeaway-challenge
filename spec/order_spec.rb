require 'order'

describe Order do
  subject(:order) {described_class.new}

  describe '#initialize' do
    it 'initializes with an empty list of items' do
      expect(order.items). to eq []
    end
  end 

end
