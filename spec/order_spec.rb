require 'order'

describe 'Order' do
  subject(:order) { Order.new }

  context 'Basket' do
    it 'should have an empty basket by default' do
      expect(order.basket).to be_empty
    end

    it 'should contain an item added to the order' do
      order.add(:pizza)
      expect(order.basket).to include :pizza
    end

    it 'should not allow you to add an item not in the menu' do
      expect { order.add(:cheese) }.to raise_error "Please enter a valid selection!"
    end
  end
end
