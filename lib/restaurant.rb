require_relative "menu"
require_relative "customer"

class Restaurant

  attr_reader :menu

  def initialize
    @new_menu = Menu.new
    @menu = @new_menu.menu
  end

  def new_order(new_custumer)
    @current_order = new_custumer.place_order
  end

  def print_bill
    counter = 1
    price = 0
    puts "Your Order: " 
    @current_order.each do |dish|
      puts "#{counter}. #{dish.capitalize} - Price: #{@new_menu.get_price(dish)}"
      price += @new_menu.get_price(dish)
      counter += 1
    end
    puts "Total: #{price}"
  end

  def send_confirmation
    "Thank you! Your order was placed and will be delivered before #{calculate_time}"
  end

  def calculate_time
    time_now = Time.now.to_s
    add_an_hour = time_now[11..12].to_i + 1
    end_time = "#{add_an_hour}#{time_now[13..15]}"
  end

end