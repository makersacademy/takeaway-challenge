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

end