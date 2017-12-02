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
    raise "#{item} is not on the menu." unless @menu.has_key?(item.to_sym)
    @menu.select do |menu_item|
       menu_item == item.to_sym
    end
  end

end
