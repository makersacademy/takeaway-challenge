require 'order'

describe 'Order' do
  subject(:order) { Order.new }

  context 'Basket' do
    it 'should have an empty basket by default' do
      expect(order.basket).to be_empty
    end

    it 'should contain an item added to the order' do
      order.add(:pizza)
      expect(order.basket).to contain_exactly(:pizza)
    end

    it 'should allow you to add multiple quantities of the same item' do
      order.add(:pizza, 2)
      expect(order.basket).to contain_exactly(:pizza, :pizza)
    end

    it 'should not allow you to add negative quantities of an item' do
      expect { order.add(:pizza, -1) }.to raise_error "Please enter a valid number of items!"
    end

    it 'should not allow you to add an item not in the menu' do
      expect { order.add(:cheese) }.to raise_error "Please enter a valid food selection!"
    end
  end

  context 'Cost' do
    xit 'should calculate the cost of what is in the basket' do

    end
  end

  context 'Display' do
    xit 'should show what food is in the basket' do

    end

    xit 'should show what the current basket cost is' do

    end
  end
end
