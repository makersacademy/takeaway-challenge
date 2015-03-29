require_relative 'take_away_order'
require_relative 'restaurant'

class Customer
  attr_reader :submit, :ord

  def select_item menu_item, _qty = 1
    fail 'this item is not on the menu' unless on_menu?
    menu.each_key { |k| k == menu_item } if menu.respond_to? :menu
  end

  def remove_item
    # reject from items hash in TakeAwayOrder class
  end

  def order_total
    # check order total with TakeAwayOrder class
  end

  def submit
  end
end
