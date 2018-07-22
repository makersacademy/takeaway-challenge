require 'order'
describe Order do
let(:order) {described_class.new}

  describe ' #add' do
    it 'adds an item from the menu to your order' do
      expect(order.add("chicken burger")).to eq(@orders)
    end
  end

  describe ' #remove' do
    # it 'raises an error if no items have been added to the order' do
    #   expect { order.remove("chicken burger") }.to raise_error 'no items to remove'
    # end
    it 'removes an item from your order' do
      order.add("vegetable fried rice")
      order.add("chicken burger")
      expect(order.remove("chicken burger")).to eq(@orders)
    end
  end

  describe ' #total' do
    it 'gives the total price of the ordered items' do
      order.add("vegetable fried rice")
      order.add("chicken burger")
      expect(order.total).to eq(10)
    end
  end

end
