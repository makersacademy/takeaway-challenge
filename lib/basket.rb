require_relative 'menu'

class Basket
  attr_reader :contents
  def initialize(menu = Menu)
    @menu = menu.new
    @contents = []
  end

  def add(dish)
    locate(dish) ? plus_one_quantity(dish) : contents << @menu.choose(dish)
  end

  private

  def locate(dish)
    contents.find { |hash| hash[:number] == dish }
  end

  def plus_one_quantity(dish)
    locate(dish)[:quantity] += 1
  end
end
