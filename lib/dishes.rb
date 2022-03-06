require_relative "dish"
class Dishes
  attr_reader :list

  def initialize(dish = [])
    @list = dish
  end

  def see_dishes
    @list.each do |dish|
      puts "#{dish.name}  £#{dish.price}"
    end
  end

end