require 'order'

describe Order do
  let(:order)       { Order.new }
  let(:food_item_1) { double(:food_item_1, :name => "Pizza", :price => 15.00) }
  let(:food_item_2) { double(:food_item_2, :name => "Chips", :price => 5.00) }

  it 'can add different quantities of different items' do
    order.add(food_item_1, 1)
    order.add(food_item_2, 2)
    expect(order.order).to eq([food_item_1, food_item_2, food_item_2])
  end

  it 'can remove multiple quantities of multiple items' do
    order.add(food_item_1, 3)
    order.add(food_item_2, 3)
    order.remove(food_item_1, 2)
    order.remove(food_item_2, 2)
    expect(order.order).to eq([food_item_1, food_item_2])
  end

  describe 'checking my order' do
    it 'can check order for a food item (false)' do
      order.add(food_item_1, 3)
      expect(order.check_order_for(food_item_1)).to eq(false)
    end

    it 'can check order for a food item (true)' do
      order.add(food_item_2, 3)
      expect(order.check_order_for(food_item_1)).to eq(true)
    end

    it 'can check order quantity (false)' do
      order.add(food_item_1, 3)
      expect(order.check_order_quantity(food_item_1, 2)).to eq(false)
    end

    it 'can check order quantity (false)' do
      order.add(food_item_1, 3)
      expect(order.check_order_quantity(food_item_1, 5)).to eq(true)
    end

    it 'can display the total price of each item based on quantity' do

    end

    it 'total price of order matches sum of item prices' do
      order.add(food_item_1, 3)
      order.add(food_item_2, 3)
      expect { order.display_order }.to output("Pizza x 3 @ : £15.00\nChips x 3 @ : £5.00\nTotal due: £60.00\n").to_stdout
    end
  end
end
