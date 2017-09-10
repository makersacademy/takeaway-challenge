require 'order'
require 'menu'

describe Order do
  subject(:order) {described_class.new}
  let(:menu) {double :menu}

  it 'creates a new instance of order' do
    expect(order).to be_a(Order)
  end

  context '#initialize' do
    it 'initialises with an empty array' do
      expect(order.food_order).to eq []
    end
    it 'initialises with a menu' do
      expect(order.menu.italian_menu).not_to be_empty
    end
  end

  context '#editing the order' do
    it 'allows the customer to add to the food order' do
      order.add("pasta", 10)
      food_order = {"pasta" => 10}
      expect(order.food_order).to include (food_order)
    end

    it 'allows the customer to delete a food order' do
      order.add("pasta", 10)
      order.delete("pasta")
      expect(order.food_order).to be_empty
    end
  end

  context '#checking the order' do
    it 'allows the customer to check their order' do
      order.add("pasta", 10)
      order.delete("pasta")
      order.add("pasta", 10)
      expect(order.food_order).to include (food_order)
    end

    it 'tells the customer the order is empty' do
      order.add("pasta", 10)
      order.delete("pasta")
      expect(order.confirm_order).to eq "Your order is empty"
    end
  end
end
