require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:menu) { double :menu, :food_options => { 'Spring rolls' => 2.50 }}

  it 'is expected find order and save to an array' do
    quantity = 1
    food_order = 'Spring rolls'
    expect(order.order_received(food_order, quantity)).to eq "Order received for #{quantity} #{food_order}."
  end

  it 'is saved, so customers can order multiple items' do
    order.order_received('Spring rolls', 1)
    expect(order.current_order[0]).to include 'Spring rolls'
  end

  it 'raises an error if the food order does not exist' do
    food_order = 'Pizza'
    expect{subject.order_received(food_order, 1)}.to raise_error "There is no #{food_order} available on the menu"
  end

  it 'adds cost of items to order bill' do
    item_cost = 2.5
    order.order_received('Spring rolls', 12)
    expect(order.bill).to eq (item_cost * 12)
  end

  it 'can check bill' do
    order.order_received('Spring rolls', 2)
    expect(order.check_bill).to eq "The bill is currently £#{order.bill}."
  end

  xit 'confirms the bill is equal to cost of items' do
    order.order_received('Spring rolls', 2)
    # expect(order.check_total?).to eq true
  end

end
