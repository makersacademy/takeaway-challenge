require_relative 'basket'
require_relative 'menu'

class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = Basket.new
  end

  def select_dish(item,quantity=1)
    raise no_item_error(item) unless on_menu?(item)
    @basket.add(name: item, quantity: quantity, price:  (@menu.menu[item]*quantity)) # must be better way to do this?
    selection_confirmation_message(item,quantity)
  end

  private

  def selection_confirmation_message(item,quantity)
    quantity == 1 ? s = '' : s = 's' #refactor later / ugly af
    quantity == 1 ? ve = 's' : ve = 've'
    "#{quantity} order#{s} of '#{item}' ha#{ve} been added to your basket."
  end

  def on_menu?(item)  #extract?
    @menu.item_exists?(item)
  end

  def no_item_error(item)
    "'#{item}' is not on our menu."
  end

end
