require_relative 'menu'

class Basket
  attr_reader :contents

  def initialize
    @contents = []
  end

  def add_dish(dish, quantity = 1)
    quantity.times { contents << dish }
  end

  def total(menu)
    sum = 0
    calculate_total(menu, sum)
  end

  private #-----------------------------

  def calculate_total(menu, sum)
    contents.each { |selection| sum += menu.dishes[selection.to_sym] }
    sum
  end

end
