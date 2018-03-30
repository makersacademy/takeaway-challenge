class PrettyPrinter
  def self.print_meals(meal_list)
    meal_list.meals.each { |i| puts "Dish : #{i.name}, Price : #{i.price}" }
  end

  def self.print_receipt(order)
  end
end
