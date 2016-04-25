class Takeaway

  def initialize(menu, order_log_class = OrderLog, contact_method_class = SMS)
    @menu = menu
    @order_log = order_log_class.new menu
    @contact_factory = contact_method_class
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
    "#{order_log.show}\n\nTotal: #{monatise order_log.total}\n\n#{confirm_msg}"
  end

  def confirm_order amount
    fail "nothing ordered" unless items_ordered?
    fail confirm_failure_msg unless correct_total? amount
    contact_customer
  end



  private
  attr_reader :order_log, :menu, :contact_factory

  def items_ordered?
    order_log.total != 0
  end

  def correct_total? amount
    amount == order_log.total
  end

  def monatise value
    format("£%.2f",value)
  end

  def confirm_msg
    "To confirm please type 'confirm order' followed by the total"
  end

  def confirm_failure_msg
    "Confirm with correct total of #{monatise order_log.total}"
  end

  def contact_customer
    contact_obj = contact_factory.new
    contact_obj.send("#{order_log.show}\nTotal: #{monatise order_log.total}")
  end

end
