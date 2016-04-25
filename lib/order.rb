require_relative "./menu"
require_relative "./text"

class Order
  attr_reader :current_order

  def initialize(menu: Menu, text: Text)
    @menu = menu.new
    @text = text.new
    @current_order = []
    @total = 0
  end

  def view_menu
    @menu.dishes
  end

  def view_order
    "Your order: #{@current_order}. Your total: £#{@total}"
  end

  def add food
    fail "This is not on the menu!" unless food_included? food
    @menu.dishes.select do |k,v|
      @current_order << {k => v} if k == food
      total
    end
    @current_order
  end

  def remove food
    fail "This is not on the menu!" unless food_included? food
    @current_order.delete_at(@current_order.find_index({food => @menu.dishes[food]}))
    total
    @current_order
  end


  def checkout
    @text.send "Your order is on it's way! Total: £#{@total} It will be delivered by #{time}" unless empty?
    @current_order = []
    total
  end

  private

  def time
    time = Time.now + (1 * 60 * 60)
    time.strftime("%I:%M%p")
  end

  def food_included? food
    @menu.dishes.key?(food)
  end

  def total
    @total = current_order.map{|i| i.values}.flatten.inject(:+)
  end

  def empty?
    @current_order.empty?
  end
end
