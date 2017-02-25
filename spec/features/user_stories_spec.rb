describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so customer can check menu, menu diplays list of dishes with prices' do
    customer = Customer.new
    menu = Menu.new
    expect { customer.display_menu(menu) }.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so customer can place an order, allows customer to select dishes from menu' do
    customer = Customer.new
    menu = Menu.new
    expect { customer.place_order(1) }.not_to raise_error
  end

  # As a shop
  # So that customers can order items
  # I would like to be able to add items to the menu
  it 'so customers can order items, allows shop to add items to menu' do
    menu = Menu.new
    expect { menu.add_items('Burger', 5) }.not_to raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
end
