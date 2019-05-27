require 'takeaway'

describe Takeaway do
  let(:takeaway)    { Takeaway.new }
  let(:food_item_1) { double(:food_item_1, :name => "Pizza", :price => 15.00) }
  let(:food_item_2) { double(:food_item_2, :name => "Chips", :price => 5.00) }
  let(:food_item_3) { double(:food_item_3, :name => "Sausages", :price => 7.00) }
  # let(:menu)        { double(:menu, check_menu_for(food_item) => false) }

  it 'can display the menu' do
    takeaway.use_default_menu
    expect { takeaway.view_menu }.to output("Pizza: £15.00\nChips: £5.00\n").to_stdout
  end

  it 'can create an order' do
    expect(takeaway.order).to be_a_kind_of(Order)
  end

  describe 'add items' do
    context 'item is available in the menu' do
      it 'can add dishes to the order' do
        takeaway.add_to_order(food_item_1, 2)
        expect(takeaway.order.order).to eq([food_item_1, food_item_1])
      end
    end

    context 'item isn\'t available in the menu' do
      it 'errors when you try to add an item not available in the menu' do
        expect { takeaway.add_to_order(food_item_3, 1) }.to raise_error 'Item requested is not available from the menu'
      end
    end
  end

  describe 'remove items' do
    context 'has items to remove' do
      it 'can remove dishes from the order' do
        takeaway.add_to_order(food_item_1, 2)
        takeaway.remove_from_order(food_item_1, 1)
        expect(takeaway.order.order).to eq([food_item_1])
      end
    end

    context 'doesn\'t have enough items to remove' do
      it 'errors when you try remove an item from an empty order' do
      end

      it 'errors when you try to remove more items than you have quantity' do
      end
    end
  end

  it 'can display an itemised bill of the order' do
    takeaway.add_to_order(food_item_1, 5)
    takeaway.add_to_order(food_item_2, 4)
    takeaway.remove_from_order(food_item_1, 1)
    expect(takeaway.view_order).to eq({ food_item_1 => 4, food_item_2 => 4 })
  end

  it 'can pay for the order' do
  end

  it 'can provide a text alert that your order has been processed' do
  end
end
