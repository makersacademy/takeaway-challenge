require 'menu'

describe user-stories do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'shows main dishes' do
    menu = Menu.new
    expect (menu.mains).not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so i can order, i want to select several dishes'
    takeaway = Takeaway.new
    menu = Menu.new
    order = Order.new
    expect { takeaway.place_order }.not_to raise_error
  end

end
