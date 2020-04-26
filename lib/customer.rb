require_relative 'menu.rb'

class Customer

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def browse_menu
    @menu.show_menu
    order_food
  end

  def order_food
    puts "Please type which dish you would like to order below:"
    @menu.add_to_basket
    return order_again
  end

  def order_again
    puts "Would you like to order another dish?"
    user = gets.chomp
    order_food if user.downcase == "yes"
    process_order if user.downcase == "no"
    # fail if user.downcase != "yes" || user.downcase != "no"
  end

  def process_order
    puts "Please see the total cost below:"
    @menu.calculate_total
    return complete_order
  end

  def complete_order
    puts "Would you like to proceed with this order?"
    user = gets.chomp
    receive_notification if user.downcase == "yes"
    cancel_order if user.downcase == "no"
  end

  def cancel_order
    "Your order has been cancelled."
  end

  def receive_notification
    return "Thank you! Your order has now been processed (see text message)."
  end
end
