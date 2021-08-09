require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:my_order) { { 'Chicken Shish' => 12, } }
  #it { expect(described_class).to be < Menu }

before do 
  order.add_dish_to_order('Chicken Shish', 2)
end


  it 'is expected to select several dishes from the menu' do
    #my_order.foods_ordered('chips', 2)
    expect(order.my_order).to eq my_order
  end

  it 'allows customer to add new dishes to the cart' do
    order.add_dish_to_order('Chicken Shish', 2)
    order.add_to_cart
    expect(order.cart).to eq([{ 'Chicken Shish' => 2 }])
  end

  it 'allows customer to get the total cost in the cart' do
    order.add_dish_to_order('Chicken Shish', 2)
    order.add_to_cart
    order.cart
    expect(order.total_cost).to eq "Your total is £24"
  end
end
