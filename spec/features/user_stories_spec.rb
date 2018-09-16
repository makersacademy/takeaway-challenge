require 'secrets'
describe 'user_stories' do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so user can check the menu, list dishes with prices' do
    menu = Menu.new

    menu.add(:pizza, Dish.new(:pizza, 2))

    expect { menu.print_menu }.to_not raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so user can order the meal, let user select some available dishes' do
    menu = Menu.new
    order = Order.new 

    menu.add(:pizza, Dish.new(:pizza, 2))
    menu.add(:lasagne, Dish.new(:lasagne, 5))
    menu.print_menu

    expect { order.add(menu.items[:lasagne] => 1, menu.items[:pizza] => 2) }.to_not raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'so user can verify the cost of their order, display the total' do
    menu = Menu.new
    order = Order.new 

    menu.add(:pizza, Dish.new(:pizza, 2))
    menu.add(:lasagne, Dish.new(:lasagne, 5))
    menu.print_menu

    order.add(menu.items[:lasagne] => 1, menu.items[:pizza] => 2)

    expect { order.calculate }.to_not raise_error
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  it 'so user can be sure there food is on the way, send text confirmation' do
    menu = Menu.new
    order = Order.new

    menu.add(:pizza, Dish.new(:pizza, 2))
    menu.add(:lasagne, Dish.new(:lasagne, 5))
    menu.print_menu

    order.add(menu.items[:lasagne] => 1, menu.items[:pizza] => 2)
    order.calculate
    order.deliver(Secrets::PERSONAL_NUMBER)
  end

end
