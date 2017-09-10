require 'order'
require 'menu'

describe Order do
  subject(:order) {described_class.new}
  let(:menu) {double :menu}

  it 'creates a new instance of order' do
    expect(order).to be_a(Order)
  end

  it 'initialises with an empty array' do
    expect(order.food_order).to eq []
  end

  it 'allows the customer to add to the food order' do
    order.add("pasta", 10)
    food_order = {"pasta" => 10}
    expect(order.food_order).to include (food_order)
  end

end
