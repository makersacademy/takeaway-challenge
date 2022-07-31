require_relative 'menu'


class Customer

  attr_reader :see_menu, :quantity
  attr_accessor :current_menu, :current_order

  def initialize(menu = Menu.new)
    @menu = menu
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

  def total_items
    total = @current_order.map{|x| x.to_s.scan(/\d+/).last.to_i }
    (total).sum
  end

end