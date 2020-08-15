require_relative "menu"
require_relative "customer"

class Restaurant

  attr_reader :menu

  def initialize
    @new_menu = Menu.new
    @menu = @new_menu.menu
  end

  def new_order(new_custumer)
    new_custumer.place_order
  end

  def print_bill(order)
    counter = 1
    price = 0
    puts "Your Order: " 
    order.each do |dish|
      puts "#{counter}. #{dish.capitalize} - Price: #{@new_menu.get_price(dish)}"
      price += @new_menu.get_price(dish)
      counter += 1
    end
    puts "Total: #{price}"
  end

  def send_confirmation
    time_now = Time.now.to_s
    add_an_hour = time_now[11..12].to_i + 1
    end_time = "#{add_an_hour}#{time_now[13..15]}"
    "Thank you! Your order was placed and will be delivered before #{end_time}"
  end

end