require_relative "dish"
class Dishes
  attr_reader :list

  def initialize(dish = [])
    @list = dish
  end

  def see_dishes
    @list.each do |hash|
      hash.each do |meal_number, dish|
        puts "#{meal_number} => #{dish.name}  £#{dish.price}"
      end
    end
    puts "Please use the numbers on the left to choose your dishes"
  end

end