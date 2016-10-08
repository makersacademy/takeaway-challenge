require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu

  def initialize
    @new_order
  end

  def print_menu
    @menu = Menu.new
    @menu.dishes_list
  end

  def start_order
    @new_order = Order.new
    @new_order.order
  end

  def add_chicken
    @new_order = Order.new if @new_order == nil
    @new_order.add_chicken
  end

  def add_lamb
    @new_order = Order.new if @new_order == nil
    @new_order.add_lamb
  end

  def add_beef
    @new_order = Order.new if @new_order == nil
    @new_order.add_beef
  end

  def check_order
    @new_order.check_order if @new_order != nil
  end
end
