require_relative 'menu'

class Basket
  attr_reader :contents

  def initialize
    @contents = {}
  end

  def add_dish(dish, quantity = 1)
    dish = dish.to_sym
    contents[dish].nil? ? (contents[dish] = quantity) : (contents[dish] += quantity)
  end

  def total(menu)
    calculate_total(menu)
  end

  private #-----------------------------

  def calculate_total(menu)
    sum = 0
    contents.each { |dish, quantity| sum += (menu.dishes[dish] * quantity) }
    sum
  end

end
