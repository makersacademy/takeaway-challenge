require_relative 'menu'
class Order
  # This class allows you to view and order dishes

  attr_reader :items, :dishes, :total_order, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @dishes = menu.dishes
    @total_order = []
  end

  def add(item, quantity=1)
    self.total_order += [dishes.select {|k, v| k == item}] * quantity
  end

  def view_dishes
    dishes
  end

  private
  attr_writer :dishes, :total_order
  attr_reader
end
