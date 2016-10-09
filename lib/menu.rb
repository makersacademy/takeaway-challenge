class Menu
  attr_reader :list

  def initialize
    @list = VEGETARIAN_MENU
  end

  def print_menu
    list.each do | dish, price |
      dish_list = (dish.to_s).ljust(25)
      price_list = "£#{price.to_s}".rjust(25)
      puts dish_list + price_list
    end
  end

private

  VEGETARIAN_MENU = { Thai_green_curry: 9, Aubergine_teriyaki: 9, Mushroom_risotto: 8, Butternut_rotolo: 9, Thali: 11, Smoky_bean_burger: 7 }

end
