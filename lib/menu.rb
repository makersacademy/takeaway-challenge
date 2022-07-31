class Menu

  attr_reader :menu

  def initialize

    @menu = Array.new

  end

  def add_dish(dish)
    @dish_names = dish
  end

  def add_price(price)
    @dish_prices = price
  end

  def add_to_list
    @menu << { dish: @dish_names, price: @dish_prices }
  end

  def display_menu
    @menu.each { |dish| pp dish }
  end
end
