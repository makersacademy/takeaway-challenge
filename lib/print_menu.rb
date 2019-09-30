class PrintMenu
  attr_reader :menu

  def initialize
    @menu = {
      "Egg Fried Rice": 3,
      "Beef Fried Rice": 5,
      "Kung Pao Chicken": 7,
      "Lemon Chicken": 6,
      "Chili Shredded Beef": 5,
      "Peking Duck": 12
    }
  end

  def see_menu_list
    @menu.each.with_index { |(dish, price), index|
      puts "#{index + 1}. #{dish}: £#{price}"
    }
  end

  def select_dish(dish)
    @menu[dish]
  end

end
