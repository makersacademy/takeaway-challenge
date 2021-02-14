class Shop
  attr_accessor :menu

  def initialize(name)
    @name = name
    @menu = []
  end

  def view_menu
    puts "View menu for #{@name}"
    @menu.each {|item| puts "Dish: #{item[:dish_name]}, Price: £#{item[:price]}"}

  end

  def add_dish(dish, price)
    @menu << { dish_name: dish, price: price}

  end

end