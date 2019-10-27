require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:items) { {'Pepperoni Pizza' => 2, 'Chicken Supreme' => 1} }
  let(:menu) { double :menu }

  it 'can select a number of dishes from menu' do
    order.add('Pepperoni Pizza', 2)
    order.add('Chicken Supreme', 1)
    expect(order.items).to eq(items)
  end
  
  it 'can calculate the total price of the order' do
    allow(menu).to receive(:price).with('Pepperoni Pizza').and_return(8)
    allow(menu).to receive(:price).with('Chicken Supreme').and_return(9)
    order.add('Pepperoni Pizza', 2)
    order.add('Chicken Supreme', 1)
    total = 25
    expect(order.total).to eq total
  end
end
