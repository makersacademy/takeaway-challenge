class Dish

  def load_dishes
    CSV.foreach("available_dishes.csv") do |line|
      dish, price, item_number = line
      #"{imported_menu = []}"
      @available_dishes << { item_number: item_number, dish: dish, price: price }
    end
  end

end

#TODO plan was to create a new class and move multiple methods from order class to dish class
#
