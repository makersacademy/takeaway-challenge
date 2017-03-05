require 'twilio-ruby'
require_relative 'menu'
require_relative 'basket'
require_relative 'messenger'

class TakeAway

  attr_reader :menu, :basket, :total_price, :messenger

def initialize(messenger = Messenger.new)
  @menu = Menu.new
  @basket = Basket.new(@menu.items)
  @total_price = 0
  @messenger = messenger
end

def view_menu
  menu.view_menu
end

def order(dish, quantity = 1)
  basket.add_item(dish, quantity)
  @total = basket.total
end

def view_basket
  basket.selected_items
end

def view_total
  "The current total is £#{("%.2f" % basket.total)}"
end

def print_summary
  @total_price = basket.total
  puts "Your basket currently contains:"
  basket.selected_items.each do | item |
    item.each do |dish, quantity|
      puts "#{dish}\t £#{quantity}"
    end
  end
  puts "\nTotal:\t £#{("%.2f" % @total_price)}"
end

def confirm_order
  delivery_time = (Time.now + (60*60)).strftime("%H:%M")
  @messenger.send_message("Thank you! Your order was placed and will be delivered before #{delivery_time}")
end

private

  def state_total
    "The current total of your order is £#{@total_price}"
  end

end
