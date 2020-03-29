require_relative 'menu'

class Order

  attr_reader :menu, :cost, :items

  def initialize(menu = Menu.new)
    @menu = menu.list
    @items = Hash.new
    @cost = 0
  end

  def update(items)
    items = items.split(", ")
    items.each { |dish|
      dishes = dish.split(" ")
      dish = dishes[1].to_sym
      number = dishes[0].to_i
      @items[dish] = number
    }
    
    calculate_cost
    @items

  end

  private

  def calculate_cost
    @cost = 0
    @items.each { |meal, number|
      item_cost = @menu[meal].split("£")[1].to_i
      @cost += (item_cost * number)
    }
  end

end
