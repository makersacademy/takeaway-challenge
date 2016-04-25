
require 'order'
describe 'Feature Test' do
  # As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  subject(:new_order) {Order.new}
  let(:restaurant) {Restaurant.new}
  let(:messenger) {Messenger.new}
  let(:menu) {{"diet coke"=>0.99, "foie gras"=>18.50, "caviar"=>99.00, "oyster"=>0.99, "champagne"=>50.00}}
  it 'passes the first feature test' do
    new_order.view_menu
    expect(new_order.view_menu).to eq menu

  end
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  it 'passes the second feature test' do
    new_order.add_item_qty("caviar", 1)
    expect{new_order.add_item_qty("coke", 1)}.to raise_error "item not available"
    new_order.add_item_qty("diet coke", 1)
    expect(new_order.basket_summary).to eq "caviar x1 = 99.0, diet coke x1 = 0.99"
  end
# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
  # 0.99 , 99 , .99
  it 'passes the third feature test'do
    new_order.add_item_qty("diet coke", 1)
    new_order.add_item_qty("caviar", 1)
    new_order.add_item_qty("oyster", 1)
    expect(new_order.checkout_order(100.98)).to be_truthy
  end
# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52"
# after I have ordered
  it 'passes the fourth feature test' do
    allow(new_order).to receive(:checkout).and_return true
    new_order.add_item_qty("diet coke", 1)
    new_order.add_item_qty("caviar", 1)
    new_order.add_item_qty("oyster", 1)
    new_order.checkout_order(100.98)
    restaurant.accept_order(new_order)
    allow(messenger).to receive(:send_order).with(new_order) {message}
    expect(restaurant.deliver).to eq message
  end
# require './lib/restaurant.rb'
# nandos=Restaurant.new
# harry=Order.new
# john=Order.new
# john.add_item_qty("diet coke", 8)
# john.add_item_qty("caviar", 8)

# harry.add_item_qty("diet coke", 8)
# harry.add_item_qty("caviar", 8)
# harry.add_item_qty("oyster", 8)
# harry.checkout_order(807.84)
# john.checkout_order(799.92)

# p nandos.accept_order(harry)
# p nandos.order_accepted
# p nandos.accept_order(john)
# p nandos.deliver

# p nandos.deliver
# p nandos.order_complete
# p nandos.order_accepted






end