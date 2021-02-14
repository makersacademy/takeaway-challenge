class Shop
  attr_reader :menu

  def initialize
    @menu = []
  end

  def view_menu
    @menu.each {|item| puts "Dish: #{item[:dish_name]}, Price: £#{item[:price]}"}

  end

  def add_dish(dish, price)
    @menu << { dish_name: dish, price: price}

  end

end