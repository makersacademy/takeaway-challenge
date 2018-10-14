
class Takeaway

  attr_reader :menu, :order

  def initialize(menu, order = nil, sms = nil)
    @menu = menu
    @order = order || Order.new(menu)
    @sms = sms || SMS.new
  end

  def display_menu
    menu.print
  end

  def checkout
    sms.confirmation
    @order = nil
    "Thankyou your order has been placed"
  end

private

  attr_reader :sms

end
