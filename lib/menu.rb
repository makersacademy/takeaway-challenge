require_relative 'dish'

class Menu
  attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = []
  end

  def add_dish(dish = Dish.new(name), price)
    @list_of_dishes << { dish: dish, price: price }
  end
  
  def print_menu
    puts "MENU"
    @list_of_dishes.each { |item| puts "#{dish_name(item)}, £#{'%.2f' % dish_price(item)}" }
  end

  private

  def dish_name(item)
    item[:dish].name
  end

  def dish_price(item)
    item[:price]
  end

end
