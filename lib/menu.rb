class Menu
  attr_reader :menu_items

  FOOD = {}

  def initialize(menu_items = FOOD)
    @menu_items
  end

  def print
    p @menu_items
  end

end
