require_relative 'menu'

class Order

  NOT_ON_MENU_ERROR = 'Sorry, that item is not on the menu.'
  INCORRECT_ESTIMATED_TOTAL_ERROR = 'Your estimated total is incorrect'
  EMPTY_BASKET_ERROR = 'Your basket is empty!'

  attr_reader :basket, :total

  def initialize(menu = Menu.new)
    @basket = {}
    @menu = menu
    @total = 0
  end

  def view_menu
    @menu.list
  end

  def add_to_basket(item,quantity=1)
    raise NOT_ON_MENU_ERROR unless @menu.list.include? item
    @basket[item] = quantity
    @total += @menu.price(item)*quantity
  end

  def checkout(estimate)
    raise EMPTY_BASKET_ERROR if basket.empty?
    raise INCORRECT_ESTIMATED_TOTAL_ERROR if estimate != total
  end

end
