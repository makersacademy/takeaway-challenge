require_relative 'menu'


class Customer

  attr_reader :see_menu, :quantity
  attr_accessor :current_menu, :current_order

  def initialize(menu = Menu.new)
    @menu = menu
    @current_order = {}
    @current_menu = current_menu
    @current_menu = []
    @current_order = []
  end

  def see_menu
    @current_menu << @menu
    @current_menu
  end

  def add_item(item, quantity)
    @current_order.push([item, quantity])
    @quantity = quantity
  end

  def remove_item(item)
    @current_order.pop
  end

end