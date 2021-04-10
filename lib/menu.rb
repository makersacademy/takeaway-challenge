require_relative "dish"

class Menu
  attr_reader :dish_list, :basket
  ::DEFAUT_MENU = [Dish.new("jerk_chicken", 11.99),
                   Dish.new("Thaï_Curry", 3.99),
                   Dish.new("Burger", 7.99),
                   Dish.new("Pasta_Pesto", 4.99),
                   Dish.new("Indian_Lamb", 11.99),
                   Dish.new("pizza", 9.99)]

  def initialize(list = DEFAUT_MENU)
    @dish_list = list
    @basket = []
  end

  def view_menu
    greeter
    menu_formatter(@dish_list)
  end

  def select_dish(num)
    fail "This dish is not in the menu" unless in_menu?(num)

    @basket << @dish_list[num - 1]
  end

  private

  def greeter
    puts "Welcome to MJ Takeaway, have a look at the menu below"
  end

  def menu_formatter(a_menu)
    a_menu.map { |dish|
      puts "#{a_menu.index(dish) + 1}. #{dish.name} for $#{dish.price}"
    }
  end

  def in_menu?(num)
    [*1..@dish_list.length].include?(num)
  end
end
