require_relative "order.rb"
require_relative "order_total.rb"


#Main engine room for the take away app. Will be placing and checking out orders
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

  def add_dish(name, price = 10, amount = 1)
    menu.create(name, price, amount)
    "#{name} added to menu"
  end

  def add_to_order(number, amount = 1)
    current_order
    menu.menu_items[number - 1].deduct(amount)
    dish = menu.menu_items[number - 1].dish
    order.add_item(dish, amount)
    order_status
  end

  def finish_order
    order_status
    send_confirmation
    orders << self.order
    reset_order
  end

  def order_status
    fail "No order has been placed" if no_order_placed?
    puts "You have selected:"
    order.items.each {|item| puts "#{item.amount} #{item.dish.name} at #{item.dish.price} pounds" }
    puts "Total: #{order.order_total}"
  end

  def show_menu
    puts "Welcome to #{name}"
    menu.available_dishes.each_with_index {|item, index| puts "#{index + 1}. #{item.dish.name}"}
  end

  def reset_order
    self.order = nil
  end

  private
  def start_order(order_klass = Order)
    self.order = order_klass.new
  end

  def current_order
    order || start_order
  end

  def send_confirmation
    order.confirm.send_confirmation
  end

  def no_order_placed?
    order.nil?
  end

end
