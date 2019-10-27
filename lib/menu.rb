require_relative 'dish'

class Menu
  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add(dish)
    @dishes[dish.name] = dish.price
    return dish
  end

  def remove(dish)
    @dishes.delete(dish.name)
    return dish
  end

  def available?(dish)
    return @dishes.include?(dish)
  end

  def show_dishes
    @dishes.each {|name, price|
      print "#{name} : #{price}\n"
    }
  end

  def menu
    @dishes
  end
end
