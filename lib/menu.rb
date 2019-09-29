require 'bigdecimal'
class Menu

  attr_reader :dishes 

  def initialize(dishes)
    @dishes = dishes
  end

  def print_menu
    @dishes.each_with_index do |dish, index|
      dish.each do |key, value| 
         puts "#{index+1}. #{key}: £#{value}"
      end
    end
  end

  def dish_included?(dish)
    dishes.each do |d|
      if d.key?(dish.to_sym)
        return true
      end
    end
    return false
  end

  def price(dish)
    dishes[dish].to_i
  end

end