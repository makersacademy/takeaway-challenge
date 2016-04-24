class Takeaway

  def initialize(menu, order_log_class = OrderLog)
    @menu = menu
    @order_log = order_log_class.new menu
  end

  def show list = 'menu'
    return menu.show if list == 'menu'
    return order_log.show if list == 'order'
    fail "That can not be shown"
  end

  def add_to_order dish, quantity
    @order_log.add dish, quantity
  end

  def remove_from_order dish, quantity
    @order_log.remove dish, quantity
  end

  def checkout
    fail "nothing ordered" unless items_ordered?
    value = format("£%.2f",order_log.total)
    confirm = "To confirm please type 'confirm order' followed by the total"
    "#{order_log.show}\n\nTotal: #{value}\n\n#{confirm}"
  end

  def confirm_order amount, contact_method = Text
    fail "nothing ordered" unless items_ordered?
    fail "Confirm with correct total of #{order_log.total}" unless correct_total? amount
    contact_method.send order_log.show
  end

  private
  attr_reader :order_log, :menu

  def items_ordered?
    order_log.total != 0
  end

  def correct_total? amount
    amount == order_log.total
  end

end
