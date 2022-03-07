require './lib/dish'

class Menu

  def initialize
    @menu = [
      Dish.new("Large Cod", 4.99),
      Dish.new("Large Haddock", 5.99),
      Dish.new("Jumbo Sausage", 3.29),
      Dish.new("Deep Fried Mars Bar", 1.99),
      Dish.new("Small Chips", 2.49),
      Dish.new("Large Chips", 3.39),
      Dish.new("Steak and Kidney Pie", 4),
      Dish.new("Mushy Peas", 0.99)
    ]
  end

  def display
    fail "No menu available" if @menu.empty?
    puts "Menu"
    @menu.each_with_index do |dish, i|
      puts "#{i + 1}. #{dish.name} - £%0.2f" % [dish.price]
    end
    puts "End Menu"
  end

end