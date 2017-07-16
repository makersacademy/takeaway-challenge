require_relative 'takeaway'

class Order
  attr_reader :dish, :quantity, :current_orders, :current_value
  def initialize
    @dish = dish
    @quantity = quantity
    @current_orders = {}
    @current_value = current_value
    @takeaway = Takeaway.new
  end

  def choose_dish
    puts "Hi, welcome please choose a dish"
    @dish = gets.chomp.to_sym
    fail 'Error #{dish} is not on the menu' unless dish_available?
    puts "Please enter the quantity"
    @quantity = gets.chomp.to_i
    save_order
  end

  def dish_available?
    @takeaway.menu.has_key?(@dish)
  end

  def save_order
    @current_orders[@dish] = @quantity, @takeaway.menu[@dish].to_f
  end

  def taken_order?
    @current_orders.has_key?(@dish)
  end

  def calculator
    @current_value = calculate(@current_orders)
  end

  def calculate(item)
    item.values.map { |each_order| each_order.inject(:*) }.map.inject(:+)
  end
end
