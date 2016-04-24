require_relative "./menu"
require_relative "./text"

class Order
  attr_reader :current_order

  def initialize(menu = Menu)
    @menu = menu.new
    @text = Text.new
    @current_order = []
    @total = 0
  end

  def view_menu
    @menu.dishes
  end

  def view_order
    "This is your order: #{@current_order} and the total is: £#{@total}"
  end

  def add food
    fail "This food item is not on the menu!" unless food_included? food
    @menu.dishes.select do |k,v|
      @current_order << {k => v} if k == food
      total
    end
    @current_order
  end

  def remove food
    fail "This food item is not on the menu!" unless food_included? food
    @current_order.select do |k,v|
      @current_order.pop({k => v}) if k == food
      total
    end
  end

  def checkout
    Text.new.send "Your order of #{@current_order} is on it's way! The total is: £#{@total}. It will be delivered by #{time}"
    # @current_order.delete!
  end

  def time
    time = Time.now + (1 * 60 * 60)
    time.strftime("%I:%M%p")
  end

  private

  def food_included? food
    @menu.dishes.has_key?(food)
  end

  def total
    @total = current_order.map{|i| i.values}.flatten.inject(:+)
  end
end
