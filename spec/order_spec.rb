require 'order'

class FakeMenu
  attr_reader :menu_items

  def initialize
    @menu_items = {
      'pizza' => 10,
      'pasta' => 7,
      'garlic bread' => 4
    }
  end
end

describe 'Order' do
  subject(:order) { Order.new(FakeMenu.new) }

  context 'Basket' do
    it 'should have an empty basket by default' do
      expect(order.basket).to be_empty
    end

    it 'should contain an item added to the order' do
      order.add('pizza')
      expect(order.basket).to contain_exactly('pizza')
    end

    it 'should allow you to add multiple quantities of the same item' do
      order.add('pizza', 2)
      expect(order.basket).to contain_exactly('pizza', 'pizza')
    end

    it 'should not allow you to add negative quantities of an item' do
      expect { order.add('pasta', -1) }.to raise_error "Please enter a valid number of items!"
    end

    it 'should not allow you to add an item not in the menu' do
      expect { order.add('cheese') }.to raise_error "Please enter a valid food selection!"
    end
  end

  context 'Cost' do
    it 'should calculate the cost of what is in the basket' do
      order.add('garlic bread')
      expect(order.cost).to eq(4)
    end
  end

  context 'Display' do
    it 'should show what food is in the basket and what the total cost is' do
      order.add('pizza', 2)
      expect(order.display_order).to eq("2 items in your order:\npizza : £10\npizza : £10\nTotal Cost £20")
    end
  end

  context 'Placing Order' do
    it 'should allow the user to place their order' do
      allow(Time).to receive(:now).and_return(Time.new(2017, 10, 12, 12, 30))

      order.add('pizza', 2)
      expect(order).to receive(:text_order).with("2 items in your order:\npizza : £10\npizza : £10\nTotal Cost £20\nYour order will arrive at 01:30PM")
      order.place_order
    end
  end
end
