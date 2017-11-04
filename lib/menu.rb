require_relative 'dish'
class Menu
  attr_reader :dishes
  def initialize
    @dish1 = Dish.new("Chocolate Melt", 7.99, "Contains milk and eggs")
    @dish2 = Dish.new("Apple Crumble", 6.99)
    @dish3 = Dish.new("Banana Split", 6.99)
    @dishes = [@dish1.dish_info, @dish2.dish_info, @dish3.dish_info]
  end

  def read_menu
    @dishes.each { |dish| dish.each { |name, price|
      puts "#{name} (£#{price})"
    } }
  end
end
