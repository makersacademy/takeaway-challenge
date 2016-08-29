require_relative 'menu'
require_relative 'text_message'

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

def submit_order(message = TextMessage.new)
  message.send_confirmation(confirm)
  order = {}
end

def delivery_time
 (Time.now + (60*60)).strftime("%H:%M")
end

private

def confirm_order(item, quantity)
"Thank you for your order: #{quantity} => #{item}."
end

def delivery_time
 (Time.now + (60*60)).strftime("%H:%M")
end

def confirm
  "Thank you for your order.  The total price is £#{total_price}. It will be delivered by #{delivery_time}"
end

end
