require_relative 'menu'
require_relative 'sms_sender'

class Order

  NOT_ON_MENU_ERROR = 'Sorry, that item is not on the menu.'
  INCORRECT_ESTIMATED_TOTAL_ERROR = 'Your estimated total is incorrect'
  EMPTY_BASKET_ERROR = 'Your basket is empty!'

  attr_reader :basket, :total

  def initialize(menu = Menu.new, sms_sender = SmsSender.new)
    @basket = {}
    @menu = menu
    @total = 0
    @sms_sender = sms_sender
  end

  def view_menu
    @menu.list
  end

  def add_to_basket(item, quantity=1)
    raise NOT_ON_MENU_ERROR unless @menu.list.include? item
    @basket[item] = quantity
    @total += @menu.price(item)*quantity
  end

  def checkout(estimate=0)
    raise EMPTY_BASKET_ERROR if basket.empty?
    raise INCORRECT_ESTIMATED_TOTAL_ERROR if estimate != total
    @sms_sender.send_sms
  end
end
