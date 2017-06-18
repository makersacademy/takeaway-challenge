require './docs/menu.rb'
require './docs/checkout.rb'

class Order

attr_accessor :menu, :checkout

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def add_dish(dish, quantity = 1)
    fail "Item not on the menu!" unless menu.dishes.include?(dish)
    create_checkout
    @checkout.save_order(dish, quantity)
  end

  def confirm_order
    puts "Your order comes to #{@checkout.calculate_total}"
    confirmation_check == "yes" ? "Thankyou, your order has been placed and should be expected to arrive #{calculate_arrival_time}" : exit
  end

private
  def calculate_arrival_time
    time = Time.now
    arrival_time = time + 1
    arrival_time = arrival_time.strftime("at %I:%M%p")
  end

  def create_checkout
    @checkout = Checkout.new
  end

  def confirmation_check
    puts "Enter 'Yes' if you would like to continue with your order"
    answer = gets.chomp.downcase
  end

end
