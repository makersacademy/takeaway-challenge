require_relative "dish"

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

    puts menu_items
  end

  private

  def format_dish(dish)
    return "#{dish.name.ljust(30, ".")}£#{"%.2f" % dish.price}"
  end
end
