describe 'user_stories' do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so user can check the menu, list dishes with prices' do
    menu = Menu.new
    expect { menu.print_menu }.to_not raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so user can order the meal, let user select some available dishes' do
    menu = Menu.new
    order = Order.new
    expect { order.add([{egg: 12}, {pineapple: 3}], 15) }.to_not raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'so user can verify the cost of their order, display the total' do
    menu = Menu.new
    order = Order.new
    order.add([{egg: 12}, {pineapple: 3}], 15)
    expect { order.calculate }.to_not raise_error
  end
end