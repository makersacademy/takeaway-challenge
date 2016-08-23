class Menu

  attr_reader :dish_list

  def initialize
    @dish_list = {"pizza"=>3.00,
                  "burger"=>2.00,
                  "chips"=>1.00}
  end

  def display
    dish_list.each {|food, price| "#{food.capitalize} £#{price}"}
  end

  def add_to_menu(food,price)
    fail 'Dish already exists' if dish_list.key?(food)
    dish_list.store(food,price)
  end
end
