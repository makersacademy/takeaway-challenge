require 'order'

describe 'Feature tests' do

  it "Tests a menu being created, a dish being added to the menu, 
  and user trying to see the items on the menu in his order." do
    menu = Menu.new
    menu.add_dish(name: "Fries",price: 3.0)
    order = Order.new(menu: menu)
    order.list_dishes
  end

end
