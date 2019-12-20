require 'order.rb'
require 'takeaway.rb'
describe Order do
let(:item) {'Chicken Rice'}
let(:quantity) { 1 }
it 'creates the instance of order'do
order = Order.new
end
context '#initialize' do
  it 'creates an empty basket' do
    order = Order.new
    expect(order.basket).to be_empty
  end
end
context '#add_to_basket' do
  it 'add items to the empty basket' do
    order = Order.new
    order.add_to_basket(item, quantity)
    expect(order.basket[item]).to eq 1
  end
end
end
