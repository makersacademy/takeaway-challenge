require_relative 'text'

class Order
  attr_reader :menu, :current, :cost

  def initialize(menu = Takeaway::DISHES, text = Text)
    @menu = menu
    @current = Hash.new { |h, k| h[k] = 0 }
    @cost = 0
    @text = text
  end

  def add_to_order(dish, quantity)
    fail "That isn't on the menu" unless menu.has_key?(dish.to_sym)
    update_current(dish, quantity)
    add_to_cost(dish, quantity)
  end

  def breakdown
    fail no_items if @cost.zero?
    order_breakdown
  end

  def pay(amount)
    fail no_items if @cost.zero?
    fail "Please pay £#{cost} to complete order" if amount != @cost
    @text.send
  end

  private

  def update_current(dish, quantity)
    @current[dish.to_sym] += quantity
    puts "#{quantity} #{dish} added to your order"
  end

  def add_to_cost(dish, quantity)
    @cost += (menu[dish.to_sym] * quantity)
  end

  def order_breakdown
    @current.each { |k, v| print "#{k} - #{v} x £#{@menu[k]}, " }
    print "Your basket total is £#{@cost}"
  end

  def no_items
    "Nothing added to order yet"
  end

end
