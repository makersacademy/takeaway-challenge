
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
    "Thankyou your order has been placed"
  end



end
