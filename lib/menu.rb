class Menu

  attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = []

  end

  def add_dish(dish = Dish.new(dish, price))
    @dish = dish
    @list_of_dishes <<  @dish.dish_for_menu
    @list_of_dishes.flatten!
  end

  def view_menu
    @list_of_dishes.each do |dish|
      puts "Dish: #{dish[:dish]}, Price: #{dish[:price]}"
    end
  end


end
