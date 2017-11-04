require 'csv'

class Dishes


  attr_reader :menu

  def initialize
    @menu = []
  end

  def list
    CSV.foreach('lib/dish_list.csv') do |line|
      dish = line[0]
      price = line[1]
      print_menu(dish.to_sym, price.to_f)
    end
  end

private

  def print_menu(dish, price)
    @menu << {dish: dish, price: price}
  end

end
