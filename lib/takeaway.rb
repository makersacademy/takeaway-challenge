class TakeAway
  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def read_menu
    menu.show
  end

  def order(dish, quantity = 1)
    raise "Sorry item is not on the menu!" if !menu.on_menu?(dish)
    basket[dish] = menu.dishes[dish] * quantity
    print_selection(dish, quantity)
    @basket
  end

  def empty_basket
    @basket = {}
  end

  private

  def print_selection(dish, quantity)
    quantity > 2 ? string = "es" : string = ""
    "You've added #{quantity} #{dish} dish" + string + " to your basket"
  end

end
