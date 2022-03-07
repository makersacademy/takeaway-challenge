require_relative 'dish'
require_relative 'order'

class Menu

  def initialize(menu = [])
    @menu = menu
  end

  def create_set_menu
    @menu << Dish.new("Spaghetti Bolognese", 16.99)
    @menu << Dish.new("Steak Frites", 25.99)
    @menu << Dish.new("Butter Chicken", 17.99)
    @menu << Dish.new("Beef Stroganoff", 18.99)
    @menu << Dish.new("Teriyaki Chicken Noodles", 14.99)
    @menu << Dish.new("Seafood Sharing Platter", 30.99)
  end

  def add_dish_to_menu(name, price)
    @menu << Dish.new(name, price)
  end

  def show_menu
    @menu.each { |x| puts "#{x.name} - £#{x.price}"}
  end

  def find_dish(dish)
    @menu.each do |x|
      if x.name == dish
        return x
      end
    end
  end

end
