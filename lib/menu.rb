class Menu
  attr_reader :list

  def initialize
    @list = VEGETARIAN_MENU
  end

  def print_menu
    list.each do | dish, price |
      puts "#{dish.capitalize} -- £#{price}"
    end
  end

private

  VEGETARIAN_MENU = { Thai_green_curry: 9, Aubergine_teriyaki: 9, Mushroom_risotto: 8 }

end
