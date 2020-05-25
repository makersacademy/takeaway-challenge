class Takeaway

  def initialize(menu, order, sms)
    @menu = menu
    @order = Order.new(menu)
    @sms = SMS.new(requirements)
  end

  def view_menu
    menu.print
  end

end
