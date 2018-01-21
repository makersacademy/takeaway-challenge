class Menu

  attr_reader :dish_list

  def initialize
    @dish_list = {"pierogi" => 4.00,
                  "kopytka" => 2.00,
                  "bigos" => 5.20}
  end

  def display
    dish_list.each {|food, price| "#{food.capitalize} £#{price}"}
  end

  def add_to_menu(food, price)
    fail 'Dish already exists' if dish_list.key?(food)
    dish_list.store(food, price)
  end

end
