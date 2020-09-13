require_relative 'menu'

class Order

  attr_reader :list, :total

  def initialize
    @list = []
  end

  def add(dish, quantity = 1)
    quantity.times { 
      @list << dish unless !Menu::MEALS.include?(dish)
    }
  end

  def remove(dish)
    @list.delete(dish)
  end

  def sum
    @total = 0
    @list.each {
      |dish| @total += (Menu::MEALS[dish])
    }
    @total.round(2)
  end

end