class MenuPrinter
  def self.print_meals(meal_list)
    meal_list.meals.each { |i| puts "Dish : #{i.name}, Price : #{i.price}" }
  end
end
