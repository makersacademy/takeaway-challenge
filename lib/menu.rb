class Menu

  attr_reader :list_of_dishes

  def initialize

    @list_of_dishes = Array.new

  end

  def add_dish(dish)
    @dish_name = dish
  end

  def add_price(price)
    @dish_price = price
  end

  def combine_list
    @list_of_dishes << { dish: @dish_name, price: @dish_price }
  end
end
