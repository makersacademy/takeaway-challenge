require_relative 'menu'
require_relative 'order'

class Restaurant
  attr_reader :pre_order, :calculated_amount, :order
  attr_accessor :estimated_amount

  def initialize(pre_order = Array.new)
    @pre_order = pre_order
  end

  def look_menu(menu = Menu.new)
    menu.printer
  end

  def choose_items(dish, qty = 0)
    pre_order <<  {:dish => dish, :qty => qty}
  end

  def calculate_amount
    check_items
    @order = Order.new(@pre_order)
    @calculated_amount = @order.calculate_total
  end

  def amount_check?
    calculate_amount
    @estimated_amount == calculated_amount
  end

  def place_order
    check_items
    raise "Incorrect sum" if !amount_check?
    order.confirmation
  end

  private
  def check_items
    raise "There are no items in the basket" if @pre_order.empty?
  end
end
