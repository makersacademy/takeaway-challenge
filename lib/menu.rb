require 'byebug'

class Menu


  def initialize
    @items = {}
  end

  def show
    @items.dup
  end

  def add_item(name, price)
    @items[name.to_sym] = price
  end
end
