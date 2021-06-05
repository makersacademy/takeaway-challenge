require_relative 'dish'

class Menu
  attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = []
  end

  def add_dish(dish = Dish.new(name), price)
    @list_of_dishes << { name: dish, price: price }
  end
  
  def print
    puts "MENU"
    @list_of_dishes.each { |item| puts "#{dish_name(item)}, £#{dish_price(item)}" }
  end

  def find_price(name)
    find_item(name)[0][:price]
  end

  private

  def dish_name(item)
    item[:name].name
  end

  def dish_price(item)
    '%.2f' % item[:price]
  end

  def find_item(name)
    @list_of_dishes.select { |item| dish_name(item) == name }
  end  
end
