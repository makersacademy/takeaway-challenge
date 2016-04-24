class Takeaway
  
  ERR_INCORRECT_PAYMENT = "The amount given is incorrect".freeze
  
  attr_reader :order
  
  def initialize(menu, order, notifier)
    @menu = menu
    @order = order.new menu
    @notifier = notifier.new
  end
  
  def print_menu
    menu.read_menu
  end
  
  def print_current_order
    order.display
  end
  
  def select_dish(dish, qty = 1)
    order.add(dish, qty)
  end
  
  def unselect_dish(dish)
    order.remove(dish)
  end
  
  def total
    order.total
  end
  
  def pay(amount = 0)
    fail ERR_INCORRECT_PAYMENT if amount != total
    notifier.send_sms
  end
  
  private
    attr_reader :menu, :notifier
    
end