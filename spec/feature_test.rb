require './docs/order'
require './docs/menu'

def new_order
  order = Order.new
  p order
end

def has_menu
  order = Order.new
  order.menu
  p order
  p order.menu
end

def order_display_menu
  order = Order.new
  order.dislay_menu
  p order
end

#
# def view_menu
#   order = Order.new
#   order.menu
#   p order
# end

# def new_menu
#   menu = Menu.new
#   p menu
# end

# def show_menu
#   menu = Menu.new
#   p menu
#   p menu.show_menu
# end
#

def empty_basket
  order = Order.new
  order.basket
  p order
end

def add_to_basket
  order = Order.new
  order.add_dish("Haddock", 3)
  p order
end

def view_basket
  order = Order.new
  order.add_dish("Haddock", 3)
  p order.basket
end

def view_basket_again
  order = Order.new
  order.add_dish("Haddock", 3)
  order.add_dish("Cod", 2)
  p order.basket
end

def view_summary
  order = Order.new
  order.add_dish("Haddock", 3)
  order.add_dish("Cod", 2)
  order.view_summary
end

def view_summary_two
  order = Order.new
  order.add_dish("Haddock", 2)
  p basket = [{ "Haddock" => 2 }]
  p order.view_summary(basket)
end


# new_order
# has_menu
# order_display_menu
# new_menu
# show_menu
# empty_basket
# add_to_basket
# view_basket
# view_basket_again
view_summary_two

# irb -r './spec/feature_test.rb'
