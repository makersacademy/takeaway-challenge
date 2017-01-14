require_relative 'menu'

class Order

  attr_reader :basket, :menu

  def initialize
    @basket = {}
    @menu = Menu.new
  end

  def add(dish, qty)
    raise not_on_menu_msg unless menu.has?(dish)
    add_to_basket(dish, qty)
  end

  def remove(dish)
    raise not_in_basket_msg unless basket.key?(dish)
    remove_from_basket(dish)
  end

  private

  def not_on_menu_msg
    "The requested item is not on the menu"
  end

  def not_in_basket_msg
    "You have not ordered this item"
  end

  def in_basket?(dish)
    basket.key?(dish)
  end

  def add_to_basket(dish, qty)
    in_basket?(dish) ? increase(dish, qty) : new_item(dish, qty)
  end

  def remove_from_basket(dish)
    basket.delete(dish)
  end

  def increase(dish, qty)
    @basket[dish] += qty
  end

  def new_item(dish, qty)
    @basket[dish] = qty
  end
end
