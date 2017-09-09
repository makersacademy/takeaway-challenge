require_relative 'dish'

class Menu

  attr_reader :menu, :dish_class

  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @menu = []
    create_menu
  end

  def create_menu
    # need to put menu_file in a file (CSV)
    menu_file = [["Fried Rice", 1], ["Special Curry", 2]]
    menu_file.each do |dish|
      new_dish = @dish_class.new(dish[0], dish[1])
      @menu << new_dish
    end
  end

  def display_menu(menu = @menu)
    @menu.each_with_index do |dish, index|
      dish_name = dish.name
      dish_price = dish.price
      p "#{index}. #{dish_name} => £#{dish_price}"
    end
  end
end
