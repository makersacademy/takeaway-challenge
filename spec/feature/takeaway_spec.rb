require 'menu'

describe 'User Stories' do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'displays a list of dishes with prices' do
    menu = Menu.new
    menu.add("Chicken", 15)
    takeaway = Takeaway.new(menu)
    expect(takeaway.show_menu).to eq ({"Chicken" => 15})
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'allows customers to order a number of several available dished' do
    menu = Menu.new
    menu.add("Chicken", 15)
    takeaway = Takeaway.new(menu)
    test_order = "2 * Chicken added to your order"
    expect(takeaway.order("Chicken", 2)).to eq test_order
  end
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'allows a customer to check prices before finalising the order' do
    menu = Menu.new
    menu.add("Chicken", 15)
    menu.add("Beef", 20)
    takeaway = Takeaway.new(menu)
    takeaway.order("Beef", 2)
    takeaway.order("Chicken", 2)
    test_order = "Your order summary is: \nBeef * 2 for $40,\nChicken * 2 for $30,\nTotal = 70"
    expect(takeaway.basket).to eq test_order
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  it 'sends a text message to confirm order was placed' do
    test_message = "Your order totalling $70 has been registered and will be delivered before 18:52"
    menu = Menu.new
    menu.add("Chicken", 15)
    menu.add("Beef", 20)
    takeaway = Takeaway.new(menu)
    allow(takeaway).to receive(:send_text).with(test_message)
    takeaway.order("Beef", 2)
    takeaway.order("Chicken", 2)
    takeaway.complete_order(70)
  end
end