class Orders

  attr_reader :orders

  def initialize(menu = Menu.new)
    @menu = menu
    @orders = {}
  end

  def cust_order(dish, how_many)
    dish = dish.gsub(" ", "_").to_sym
    raise "sorry, dish is not available" unless Menu::MENU_SELECTIONS.include? dish
    @orders[dish] = how_many
  end

  def price(dish)
    dish = dish.gsub(" ", "_").to_sym
    @menu.menu_items[dish]
  end

  def bill
  end



end
