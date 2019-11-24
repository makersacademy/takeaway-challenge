require 'takeaway'

RSpec.describe Takeaway do
  let(:test_takeaway) { Takeaway.new(test_menu, test_message_client) }

  let(:item_1) { double(:pizza, name: :pepperoni_pizza, price: 8) }
  let(:item_2) { double(:pizza, name: :margherita_pizza, price: 6) }
  let(:item_3) { double(:pizza, name: :vegetarian_pizza, price: 6) }
  let(:item_4) { double(:pizza, name: :sausage_pizza, price: 8.5) }

  let(:listing_1) { double(:menu_listing, dish: item_1, servings_left: 1, register_sale: true) }
  let(:listing_2) { double(:menu_listing, dish: item_2, servings_left: 2, register_sale: true) }
  let(:listing_3) { double(:menu_listing, dish: item_3, servings_left: 4, register_sale: true) }
  let(:listing_4) { double(:menu_listing, dish: item_4, servings_left: 0, register_sale: true) }

  let(:test_menu) { double(:menu, dishes: [listing_1, listing_2, listing_3, listing_4]) }
  let(:test_message_client) { double(:message_client, send_message: true, confirm_order: 'message sent') }

  it 'has a menu' do
    expect(test_takeaway.view_menu).to eq "Item 1: Pepperoni Pizza – £8\nItem 2: Margherita Pizza – £6\nItem 3: Vegetarian Pizza – £6\nItem 4: Sausage Pizza – £8.5"
  end

  it 'can take an order for a pepperoni pizza and a margherita pizza' do
    test_takeaway.add_to_order(item_1)
    test_takeaway.add_to_order(item_2)

    expect(test_takeaway.view_current_order).to eq "Pepperoni Pizza – Quantity: 1\nMargherita Pizza – Quantity: 1"
  end

  it 'can take an order for a vegetarian pizza and two margherita pizzas' do
    test_takeaway.add_to_order(item_3)
    test_takeaway.add_to_order(item_2)
    test_takeaway.add_to_order(item_2)

    expect(test_takeaway.view_current_order).to eq "Vegetarian Pizza – Quantity: 1\nMargherita Pizza – Quantity: 2"
  end

  it 'denies an order when a dish is out of stock' do
    expect { test_takeaway.add_to_order(item_4) }.to raise_error Takeaway::OUT_OF_STOCK
  end

  it 'denies an order which surpasses the available stock' do
    test_takeaway.add_to_order(item_1)
    
    expect { test_takeaway.add_to_order(item_1) }.to raise_error Takeaway::ORDER_EXCEEDS_STOCK
  end

  describe '#remove_from_order' do
    it 'removes items from the current order' do
      test_takeaway.add_to_order(item_1)
      test_takeaway.add_to_order(item_2)
      test_takeaway.remove_from_order(item_1)

      expect(test_takeaway.view_current_order).to eq "Margherita Pizza – Quantity: 1"
    end
  end

  it 'begins a new order once an order has been successfully placed' do
    test_takeaway.add_to_order(item_1)
    test_takeaway.add_to_order(item_2)
    test_takeaway.place_order
    test_takeaway.add_to_order(item_3)

    expect(test_takeaway.view_current_order).to eq "Vegetarian Pizza – Quantity: 1"
  end
end
