require 'menu'
require 'order'

describe "Feature Test" do

  #As a customer
  #So that I can check if I want to order something
  #I would like to see a list of dishes with prices
  it "passes user story 1" do
    p_pizza = Dish.new("Pepperoni Pizza", 9.50)
    m_pizza = Dish.new("Margherita Pizza", 7.50)
    menu = Menu.new(p_pizza, m_pizza)
    expect(menu.list).to eq "Pepperoni Pizza - £9.50, Margherita Pizza - £7.50"
  end

  #As a customer
  #So that I can order the meal I want
  #I would like to be able to select some number of several available dishes
  it "passes user story 2" do
    p_pizza = Dish.new("Pepperoni Pizza", 9.50)
    m_pizza = Dish.new("Margherita Pizza", 7.50)
    menu = Menu.new(p_pizza, m_pizza)
    order = Order.new(menu)
    order.add("Pepperoni Pizza", 2)
    order.add("Margherita Pizza", 1)
    expect(order.my_order).to eq([p_pizza, p_pizza, m_pizza])
  end

  #As a customer
  #So that I can verify that my order is correct
  #I would like to check that the total I have been given matches the sum of
  #the various dishes in my order
  it "passes user story 3" do
    p_pizza = Dish.new("Pepperoni Pizza", 9.50)
    m_pizza = Dish.new("Margherita Pizza", 7.50)
    menu = Menu.new(p_pizza, m_pizza)
    order = Order.new(menu)
    order.add("Pepperoni Pizza", 2)
    order.add("Margherita Pizza", 1)
    expect(order.order_cost).to eq(26.5)
  end

  #As a customer
  #So that I am reassured that my order will be delivered on time
  #I would like to receive a text such as "Thank you! Your order was placed and
  #will be delivered before 18:52" after I have ordered
  let(:message_class) { double(:message_class, send: true, new: true ) }
  it "passes user story 4" do
    p_pizza = Dish.new("Pepperoni Pizza", 9.50)
    m_pizza = Dish.new("Margherita Pizza", 7.50)
    menu = Menu.new(p_pizza, m_pizza)
    order = Order.new(menu, message_class)
    order.add("Pepperoni Pizza", 2)
    order.add("Margherita Pizza", 1)
    expect(order).to respond_to(:confirm)
  end
  end
