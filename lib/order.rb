require_relative 'menu'

class Order

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu.list
    @items = Hash.new
  end

  def update(items)
    items = items.split(", ")
    items.each { |dish|
      dishes = dish.split(" ")
      dish = dishes[1].to_sym
      number = dishes[0].to_i
      @items[dish] = number
    }
    @items

  end

end
