require 'order'
require 'menu'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe Order do
  it 'starts a new order' do
   order = Order.new
  end
end

describe Menu do
  it 'lists available_dishes' do
   menu = Menu.new
   menu.show_menu
  end
end