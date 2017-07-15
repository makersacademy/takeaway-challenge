require 'order'

describe Order do

  let(:item) { "Pepperoni pizza" }
  let(:quantity) { 1 }
  let(:price) { 11.99 }
  subject(:order) { described_class.new }

  it 'is initialized with an empty basket' do
    expect(order.basket).to eq []
  end

  describe '#add' do
  it 'lets the customer select items and a quantity from the menu along with the price' do
    expect(order.add(item, quantity, price)).to eq "#{quantity} x #{item}, costing £#{quantity * price} have been added to your order"
  end

  it 'stores the selected items' do
    expect { order.add(item, quantity, price) }.to change{ order.basket.length }.by(1)
  end
  end

  it 'calcuates the total of the order in the basket' do
    order.add(item, quantity, price)
    expect(order.total).to eq "Total of £#{price}"
  end

end
