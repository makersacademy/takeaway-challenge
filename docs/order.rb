require './docs/menu.rb'

class Order

attr_accessor :total_basket, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @total_basket = {}
  end

  def add_dish(dish, quantity = 1)
    fail "Item not on the menu!" unless menu.dishes.include?(dish)
    @total_basket.store(dish, quantity)
  end

  def display_total
    p "Your bill comes to £#{calculate_total}"
  end

  def confrim_order
    puts "Enter 'Yes' if you would like to continue with your order"
    answer = gets.chomp.downcase
    answer == "yes" ? "Thankyou, your order has been placed and should be expected to arrive #{calculate_arrival_time}" : exit
  end

private
  def calculate_arrival_time
    time = Time.now
    arrival_time = time + 1
    arrival_time = arrival_time.strftime("at %I:%M%p")
  end

  def calculate_total
    total = 0
    @total_basket.each do |k, v|
    total = total + (v * menu.find_price(k))
    end
    total
  end

end
