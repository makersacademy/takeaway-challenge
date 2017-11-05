require './lib/menu.rb'
require './lib/calculate.rb'

class Takeaway

attr_reader :basket, :list

  def initialize(menu = Menu.new, sum = Calculate.new)
    @basket = []
    @menu = menu
    @sum = sum
  end

  def menu
    @menu.list
  end

  def order(dish)
    @basket << add_dish(dish)
  end

  def total
    @sum.total(@basket)
  end


  private
  def add_dish(dish)
    @menu.list.select { |k| k[:name].include?(dish) }
  end
end
