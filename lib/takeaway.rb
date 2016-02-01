require_relative 'menu'
require_relative 'sms_handler'

class Takeaway
  def initialize(menu = Menu.new, sms_handler = SmsHandler.new)
    @basket = Hash.new([0, 0])
    @menu = menu
    @sms_handler = sms_handler
  end

  def basket
    @basket.dup
  end

  def show_menu
    @menu.list
  end

  def order(item, quantity = 1)
    quantity += @basket[item].first
    @basket[item] = quantity, quantity * @menu.price(item)
  end

  def bill
    @basket.inject(0) { |sum, (_itm, (_qtty, subtotal))| sum + subtotal }
  end

  def checkout(estimate)
    fail 'Basket is empty!' if @basket.empty?
    fail 'Incorrect estimated total!' unless estimate == bill
    @sms_handler.send(estimate)
  end
end
