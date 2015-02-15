class Menu

  attr_reader :dishes

  def initialize
    @dishes = Hash.new
  end

  def dish_list
    dishes.keys 
  end

  def add_dish(dish)
    dishes[dish] = :no_price
  end

  def set_price_of(dish, to_price)
    dishes[dish] = to_price
  end

  def price_of(dish)
    dishes[dish]
  end 

  def print
    dishes.each { |dish, price| puts "#{dish.name}".ljust(15) + "{price}".rjust(15)}
  end

end