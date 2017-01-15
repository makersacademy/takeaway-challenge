require_relative 'menu'
require_relative 'basket'
require 'twilio-ruby'
require 'time'

class TakeAway

  attr_reader :menu, :basket, :total

def initialize
  @menu = Menu.new
  @basket = Basket.new(@menu.items)
  @total = 0
end

def view_menu
  @menu.view_menu
end

def order(dish, quantity = 1)
  basket.add_item(dish, quantity)
end

def view_basket
  @basket.selected_items
end

def view_total
  @total = @basket.total
  "The current total of your basket is £#{("%.2f" % @total)}"
end

def print_summary
  puts "Your basket currently contains:"
  @basket.selected_items.each do | item |
    item.each do |dish, quantity|
      puts "#{dish}\t £#{quantity}"
    end
  end
  puts "\nTotal:\t £#{("%.2f" % @total)}"
end

def confirm_order
  send_message
end

private

  def state_total
    "The current total of your order is £#{@total}"
  end

  def send_message
    client = Twilio::REST::Client.new("AC733e80d8eb5305704027651938977331", "dcefc4c1240246c8199c00577dee0116")
    delivery_time = (Time.now + (60*60)).strftime("%H:%M")
    client.messages.create(
      from: "+441133205947",
      to: "+447921613637",
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )
  end

end
