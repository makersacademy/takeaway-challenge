require './lib/order'
require './lib/takeaway'

describe Order do
  let(:test_order) { Order.new }

  describe '#add_item' do
    it 'adds item to basket' do
      expect(test_order.add_item("quesidilla",1)).to eq 1
    end
  end

  describe '#check_basket' do
    it 'calculates the total of the order' do
      test_order.add_item('quesidilla', 1)
      expect(test_order.check_basket).to eq 5
    end
  end
end
