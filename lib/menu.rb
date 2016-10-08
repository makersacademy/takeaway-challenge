class Menu
attr_reader :current_menu
  def initialize
    @current_menu = [
      {dish_category: 'Main course:', dish_number: 11, dish: 'pizza', price: 10},
      {dish_category: 'Main course:', dish_number: 12, dish: 'pasta', price: 12},
      {dish_category: 'Starter:', dish_number: 1, dish: 'salad', price: 8},
      {dish_category: 'Dessert:', dish_number: 111, dish: 'tart', price: 7},
      {dish_category: 'Drink:', dish_number: 1111, dish: 'water', price: 4},
      {dish_category: 'Drink:', dish_number: 1112, dish: 'wine', price: 6}
      ]
  end


  def select_a_dish(dish_number)
    @current_menu.detect {|d| d[:dish_number] == dish_number }
  end

  def print_menu
    @current_menu.each do |dish|
    dish_data = [dish[:dish_category], dish[:dish], "£#{dish[:price]}", " number: #{dish[:dish_number]}"]
    puts dish_data.join(" ")
    end
  end

end
