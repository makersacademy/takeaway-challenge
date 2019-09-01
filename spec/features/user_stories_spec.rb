require 'menu'
require 'order'

describe 'User Stories - the program' do
  let(:menu) { Menu.new }
  let(:order) { Order.new(menu) }
  let(:text) { Text.new('+44123456') }
  let(:dish) { "fish" }
  let(:price) { 5 }
  let(:quantity) { 1 }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'allows the customer to see a list of dishes from the menu' do
    expect(menu.read).to eq(menu.dishes)
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'allows a customer to select some number of several available dishes' do
    order.select_dish(dish, quantity)
    order.select_dish(dish, quantity)
    expect(order.current_order).to eq({ "fish" => 2 })
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'allows a customer can check the total of the order is correct' do
    user_total = order.order_total
    expect(order.check_total(user_total)).to eq true
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  xit 'sends a text confirmation to the user when order placed' do
    # TESTED THIS WITH VALID MOBILE NUMBER AT IT WORKS
    expect { text.send }.to change { text.message_sent }.from(false).to(true)
  end
end
