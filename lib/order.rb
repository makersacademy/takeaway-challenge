require_relative 'menu'
class Order
  attr_reader :items
  def initialize(menu = Menu.new)
    @menu = menu
    @items = menu.dishes
  end

  def add(item)
    self.items << item
  end

  private
  attr_writer :items
end
