# IRB SCRIPT
# irb -r ./lib/order.rb

require_relative 'takeaway'
require_relative 'text'

class Order
  attr_reader :menu, :current, :cost

  def initialize (menu = Takeaway::DISHES, time = Time)
    @menu = menu
    @current = Hash.new { |h, k| h[k] = 0 }
    @cost = 0
    @time = time
  end

  def add_to_order(dish, quantity)
    fail "That isn't on the menu" unless menu.has_key?(dish.to_sym)
    update_current(dish, quantity)
  end

  def breakdown
    fail no_items if @cost == 0
    order_breakdown
  end

  def pay(amount)
    fail no_items if @cost == 0
    fail "Please pay £#{cost} to complete order" if amount != @cost
    @time.send
  end

  private

  def update_current(dish, quantity)
    @current[dish.to_sym] += quantity
    @cost += (menu[dish.to_sym] * quantity)
    puts "#{quantity} #{dish} added to your order"
  end

  def order_breakdown
    @current.each { |k,v| print "#{k} - #{v} x £#{@menu[k]}, " }
    print "Your basket total is £#{@cost}"
  end

  def no_items
    "Nothing added to order yet"
  end

end
