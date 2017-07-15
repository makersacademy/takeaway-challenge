require 'order'


describe Order do

let(:item) { "Pepperoni pizza" }
let(:quantity) { 2 }
let(:price) { 11.99}
subject(:order) { described_class.new(item, quantity, price) }

  it 'can create a new order' do
    expect(order.basket).to eq [{ :dish => item, :quantity => quantity, :price => price }]
  end

  describe '#add' do
  it 'lets the customer select items and a quantity from the menu along with the price' do
    expect(order.add(item, quantity, price)).to eq "#{quantity} x #{item}, costing £#{quantity*price} have been added to your order"
  end

  it 'stores the selected items' do
    expect{ order.add(item, quantity, price) }.to change{ order.basket.length }.by(1)
  end
  end

end
