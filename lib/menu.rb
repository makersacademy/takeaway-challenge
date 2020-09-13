require_relative "dish"
require_relative "order"

class Menu
  attr_reader :name, :menu

  DEFAULT_NAME = "Mildreds"
  DEFAULT_MENU = [Dish.new("Soul Bowl", 13.99),
                  Dish.new("Tofu Donburi", 13.50),
                  Dish.new("Buffalo Chick'n Burger", 10.00),
                  Dish.new("Gyoza", 6.50)]

  def initialize(name = DEFAULT_NAME, menu = DEFAULT_MENU)
    @name = name
    @menu = menu
  end

  def view_menu
    menu_items = @menu.collect { |dish|
      format_dish(dish)
    }
    print_header
    puts menu_items
  end

  def get_dish(dish_name)
    raise "Dish is not on the menu" if dish_not_on_menu?(dish_name)

    @menu.each { |menu_dish|
      if dish_name.downcase == menu_dish.name.downcase
        return menu_dish
      end
    }
  end

  private

  def dish_not_on_menu?(dish_name)
    @menu.each { |menu_dish|
      if dish_name.downcase == menu_dish.name.downcase
        return false
      end
    }
  end

  def print_header
    puts "Welcome to #{@name.ljust(25, ".")}"
  end

  def format_dish(dish)
    return "#{dish.name.ljust(30, ".")}£#{"%.2f" % dish.price}"
  end
end
