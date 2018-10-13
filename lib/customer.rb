class Customer

  attr_reader :order

  def initialize(text = SmsText.new)
    @order = Order.new
    @sms = text
  end

  def check_menu(menu)
    menu.list_dishes if menu.is_a?(Menu) # Uses the menu.list funtion if menu
  end

  def select_dish(menu, dish, num)
    num.times do
      @order.order << menu.find_dish(dish)
    end
    "#{num} #{dish} added" if @order.added?
  end

  def verify_order
    @order.print_list
  end

  def total_balance
    @order.total
  end

  def place_order
    @sms.send_text
  end

end
