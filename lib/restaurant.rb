require_relative "order.rb"
require_relative "order_total.rb"

#Will be placing and checking out orders
class Restaurant
  attr_reader :name, :menu, :orders
  attr_accessor :order


  DEFAULT_NAME = "Top 5"
  def initialize(name = DEFAULT_NAME, menu_klass = Menu)
    @name = name
    @menu = menu_klass.new
    @order
    @orders = []
  end

  def add_dish(name, price = 10, amount = 1, dish_klass = Dish)
    dish = dish_klass.new(name, price)
    menu.create(dish, amount)
  end

  def start_order(order_klass = Order)
    self.order = order_klass.new
  end

  def order_status
    puts "You have selected:"
    order.items.each {|item| puts "#{item.amount} #{item.dish.name}: #{order.order_total} pounds" }
  end

  def finish_order(order)
    orders << order
    reset_order
  end

  def reset_order
    self.order = nil
  end

end
