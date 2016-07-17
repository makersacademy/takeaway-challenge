require_relative 'basket'
require_relative 'menu'
require_relative 'sms'

class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = Basket.new
  end

  def select_dish(item,quantity=1)
    raise not_on_menu_error(item) unless on_menu?(item)
    add_selection_to_basket(item,quantity)
    selection_confirmation_message(item,quantity)
  end

  def place_order
    raise no_item_error if no_items_in_basket?
    @sms = Sms.new(@basket.total_price)
    @sms.send
    @basket.clear
    order_placed_message
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

  def not_on_menu_error(item)
    "'#{item}' is not on our menu."
  end

  def no_item_error
    'You must select atleast one item before placing an order.'
  end

  def no_items_in_basket?
    @basket.items.length < 1
  end

  def order_placed_message
    "Your order has been placed you should receive a confirmation text within a few moments."
  end

  def add_selection_to_basket(item,quantity)
    @basket.add(name: item, quantity: quantity, price:  (@menu.menu[item]*quantity))
  end

end
