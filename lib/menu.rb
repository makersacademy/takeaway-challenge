class Menu

  attr_reader :list_of_dishes

  def initialize

    @list_of_dishes = Array.new

  end
  
  def add_dish(dish)
    @dish_names = dish
  end

  def add_price(price)
    @dish_prices = price
  end

  def add_to_list
    @list_of_dishes << { dish: @dish_names, price: @dish_prices }
  end

  def display_menu
    []
  end
end
