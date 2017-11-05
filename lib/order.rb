# IRB SCRIPT
# irb -r ./lib/order.rb

require_relative 'takeaway'

class Order
  attr_reader :menu, :current, :cost

  def initialize (menu = Takeaway::DISHES)
    @menu = menu
    @current = Hash.new { |this_hash, key| this_hash[key] = 0 }
    @cost = 0
  end

  def add_to_order(dish, quantity)
    fail "That isn't on the menu" unless menu.has_key?(dish.to_sym)
    update_current(dish, quantity)
  end

  def breakdown
    fail "Nothing added to order yet" if @cost == 0
    order_breakdown
  end

  def pay(amount)
    fail "Nothing added to order yet" if @cost == 0
    fail "Please pay £#{cost} to complete order" if amount < @cost
    print "Thank you! Your order has been placed succesfully and will be delivered before #{Time.now + 3600}"
  end

  private

  def update_current(dish, quantity)
    @current[dish.to_sym] += quantity
    @cost += (menu[dish.to_sym] * quantity)
    puts "#{quantity} #{dish} added to your order"
  end

  def order_breakdown
    puts "Your current basket"
    puts ""
    @current.each { |k,v| puts "#{k} - #{v} x £#{@menu[k]}" }
    puts "Your basket total is £#{@cost}"
  end
end
