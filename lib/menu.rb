require_relative 'item'

class Menu

  def initialize
    @menu = []
  end

  def add(name, price, item = Item.new(name, price))
    @menu << item
  end

  def display
    @menu
  end

end
