require_relative 'menu'

class Order

  attr_reader :selection, :menu
  DEFAULT_MENU = { "chicken tikka": 9, "beef madras": 10, "vegetable vindaloo": 8 }

  def initialize
    @selection = []
  end

  def add_to_order(dish, quantity)
    @selection.push({ dish: dish, quantity: quantity })
  end

  def calculate_total
    sum = 0
    @selection.each do |hash|
      sum += DEFAULT_MENU[hash[:dish].to_sym] * hash[:quantity]
    end
    return sum
  end

end
