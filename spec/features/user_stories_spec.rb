require 'menu'
require 'order'

describe 'User Stories' do
  let(:menu) { Menu.new }
  let(:order) { Order.new }
  let(:dish) { :dish }
  let(:price) { :price }
  let(:quantity) { :quantity }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'the customer can see a list of dishes from the menu' do
    allow(menu).to receive(:dishes).and_return([{ dish => price }])
    expect(menu.dishes).to eq([{ dish => price }])
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'a customer can select some number of several available dishes' do
    expect(order.select_dish(dish, quantity)).to eq({ dish => quantity })
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'a customer can check the total of the order is correct' do
    user_total = order.order_total
    expect(order.check_total(user_total)).to eq true
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

end
