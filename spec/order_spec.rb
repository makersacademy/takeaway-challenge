require 'order.rb'
require 'takeaway.rb'
describe Order do
let(:item) {'Chicken Rice'}
let(:quantity) { 1 }
let(:menu) { double(:menu, dishes: { 'Chicken Rice' => 4.50 }) }
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
context '#sum_of_basket'do
  it 'it confirm the sum of all the dishes on the basket' do
    order = Order.new
    order.add_to_basket(item, quantity)
    confirmation  = "You have order #{item} & #{quantity} = £#{(menu.dishes[item]*quantity)}," #This is a confirmation message to the customer confirming the order
    expect{order.sum_of_basket(menu)}.to output(confirmation).to_stdout
end
end
end
