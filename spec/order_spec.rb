describe Order do
  subject(:order) { described_class.new }

  describe '#add_item' do
    it 'updates the total with the price of the item' do
      dish = { description: 'Roast pork',       price: 15 }
      expect{ order.add_item(dish) }.to change{order.total}.by dish[:price]
    end
  end 

end 
