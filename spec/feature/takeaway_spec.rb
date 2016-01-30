require 'menu'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe 'User Stories' do
  it 'displays a list of dishes with prices' do
    menu = Menu.new
    menu.add("Chicken", 15.50)
    takeaway = Takeaway.new(menu)
    expect(takeaway.show_menu).to eq ({"Chicken" => 15.50})
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

  it 'allows customers to order a number of several available dished' do
    menu = Menu.new
    menu.add("Chicken", 15.50)
    menu.add("Beef", 20.20)
    menu.add("Lamb", 13.20)
    takeaway = Takeaway.new(menu)
    takeaway.order("Beef", 2)
    takeaway.order("Chicken", 2)
    order = "Beef * 2, Chicken * 2, "
    expect(takeaway.basket).to eq order
  end
end