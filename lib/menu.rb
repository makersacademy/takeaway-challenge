class Menu
  def initialize
    @menu = {
      Breakfast: 1,
      Lunch: 2,
      Dinner: 3
    }
  end

  def print_menu
    puts @menu
  end

  def choose_item(item)
    @menu.select do |menu_item|
       menu_item == item.to_sym
    end
  end

end
