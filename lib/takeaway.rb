require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu , :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def list_items
    @menu.current_menu
  end

  def add_dish(dish, amount)
    @menu.add(dish, amount)
  end


  # def add_order( dish, amount =1)
  #   message = "Item not available from menu, please select another"
  #   raise message  unless dish_exist?(dish)
  #   amount.times {@order <<  dish}
  #   amount.times
  #   "#{amount} #{dish} added to order"
  # end

  def show_menu
    message = "Please add options to the menu."
    raise message if menu.current_menu.empty?
    menu.current_menu.each do |x|
    puts "#{x[:food]}: £#{x[:amount]}"
    end
  end

  def add_to(dish)
    @order.order(dish, show_menu)
  end

  def total_order
    @order.current_total
  end

  def see_current_order
    @order.current_order
  end

  def order_checkout
    @order.checkout_order
  end

end
