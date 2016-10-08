class Menu
  attr_reader :list

  VEGETARIAN_MENU = { Thai_green_curry: 9, Aubergine_teriyaki: 9, Mushroom_risotto: 8 }

  def initialize
    @list = VEGETARIAN_MENU
  end

  def print_menu
    idx = 1
    list.each do | dish, price |
      puts "#{idx}. #{dish.capitalize} -- £#{price}"
      idx += 1
    end
  end

end
