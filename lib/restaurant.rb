require_relative 'menu'

class Restaurant

attr_reader :menu, :order

def initialize(menu: Menu.new)
  @menu = menu
  @order = {}
end

def display_menu
  menu.print_menu
end


def order_food(item, quantity = 1)
  item = item.capitalize
  fail "That is not on the menu" unless menu.menu.has_key?(item)
  #order.merge!(item: item, quantity: quantity)
  @order.store(item, quantity)
  confirm_order(item, quantity)
end


def total_price
  total = 0
  order.each do |item, quantity|
    total += (quantity * menu.print_price(item))
  end
  total
end

def confirm_order(item, quantity)
"Thank you for your order: #{quantity} => #{item}."
end

def confirm_total_price
  "Your order comes to #{total_price}"
end

end
