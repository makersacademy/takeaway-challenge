require 'order'

describe Order do

  subject(:order) {described_class.new}

  describe '#basket' do
    it 'starts as empty' do
      expect(order.basket).to match_array([])
    end
  end

end
