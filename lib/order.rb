require_relative 'menu'
require_relative 'takeaway'

class Order

  attr_accessor :current_order
  attr_reader :menu, :receipt, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @select = {}
    @current_order = []
    @receipt = []
    @basket = []
  end

  def add(dish, quant = 1)
    p dish.to_sym
    p @menu.avail_dishes.any?(dish.to_sym)
    fail "Please select something from the menu" if @menu.avail_dishes.any?(dish) == false
    @select = { dish.to_sym => quant }
    @current_order << @select
  end

  def total
    checkout
    @total = @receipt.inject(0) { |sum, x| sum + x }
  end

  def checkout
    @current_order.each do |item|
      item.each do |dish, quant| 
        @basket << "#{dish}, X #{quant} "
        @cost = menu.avail_dishes[dish] * quant
        @receipt << @cost
      end
    end
  end

  def print_basket
    show_menu = @menu.customer_view
    puts "#{show_menu}" + "\n" + "Your order is as follows: " + "\n"
    puts basket
    puts "\n"
    return "Total to pay: £#{@total}"
  end

end
