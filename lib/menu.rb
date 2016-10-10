# require_relative 'dishes'

class Menu
  attr_reader :menu

  def initialize
    @menu = []
  end

  def load(dish)
    @menu << dish
  end

end

# takeaway_menu = Menu.new
# rice = Dishes.new("Fried Rice", 2)
# noodle = Dishes.new("Fried Noodle", 2)
# chips = Dishes.new("Chips", 2)
# tofu = Dishes.new("Ma Po Tofu", 3)
# prawn = Dishes.new("Szechuan King Prawn", 3)
# beef = Dishes.new("Stir Fried Beef", 3)
# chicken = Dishes.new("Satay Chicken", 3)
# fish = Dishes.new("Fish in Sweet and Sour Sauce", 4)
# pok_choy = Dishes.new("Stir Fried Pok Choy", 2)
# takeaway_menu.load(rice)
# takeaway_menu.load(noodle)
# takeaway_menu.load(chips)
# takeaway_menu.load(tofu)
# takeaway_menu.load(prawn)
# takeaway_menu.load(beef)
# takeaway_menu.load(chicken)
# takeaway_menu.load(fish)
# takeaway_menu.load(pok_choy)
