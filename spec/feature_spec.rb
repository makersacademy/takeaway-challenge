require './spec/spec_helper.rb'

feature "Take Away Challenge" do

  menu = [{dish: 'Hawaiian' , price: '8.99'},
    {dish: 'BBQ Original', price: '6.99'},
    {dish: 'Vegeterian', price: '7.99'},
    {dish: 'Four Seasons', price: '5.99'},
    {dish: 'Seafood' , price: '8.99'},
    {dish: 'Margerita' , price: '4.99'},
    {dish: 'Ceasar Salad' , price: '5.90'}
   ]

   let(:dishes) {Dishes.new(menu)}
   let(:order) {CustomerOrder.new(dishes)}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  scenario "Print Menu" do
    expect(dishes.menu.count).to eq 7
    dishes.menu
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  scenario "Select from menu" do
    order_1 = ['Hawaiian', 2]
    order_2 = ['Vegeterian', 3]
    order.select_dish(order_1[0], order_1[1])
    order.select_dish(order_2[0], order_2[1])
    orders = [{dish: 'Hawaiian', quantity: 2},{dish: 'Vegeterian', quantity: 3}]
    expect(order.selection).to eq orders
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  scenario "Verify total" do
    order_1 = ['Hawaiian', 2]
    order_2 = ['Vegeterian', 3]
    customer_amount = 41.95
    order.select_dish(order_1[0], order_1[1])
    order.select_dish(order_2[0], order_2[1])
    expect(order.bill_valid?(customer_amount)).to be true
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  scenario "Send Text" do
    order_1 = ['Hawaiian', 2]
    order_2 = ['Vegeterian', 3]
    customer_amount = 41.95
    order.select_dish(order_1[0], order_1[1])
    order.select_dish(order_2[0], order_2[1])

  end

end
