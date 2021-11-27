require_relative 'dishes'

class Menu
  attr_reader :dishes

  def initialize
    @dishes_list = Dishes.new
  end

  def print_available_dishes
    @dishes_list.dishes.each do |dish|
      puts "#{dish[:name]}: £#{dish[:price]}"
    end
  end
end
