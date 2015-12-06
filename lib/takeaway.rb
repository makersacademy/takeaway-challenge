class Takeaway

  attr_reader :menu, :order, :order_klass, :bill, :history

  def initialize(menu, order_klass)
    @menu = menu
    @order_klass = order_klass
    @order = order_klass.new
    @history = []
  end

  def check_menu
    menu.dishes
  end

  def place_order(dish, qty=1)
    fail "Not on menu: #{dish}" if not_on_menu?(dish)
    order.take_order(dish, qty)
    order_summary
  end

  def check_order
    order_summary
  end

  def confirm_order
    calculate_bill
  end

  def complete_order
    history << order

    new_order
  end

  private

  def calculate_bill
   bill = 0
   @order.current_order.each{|k, v| bill += @menu.dishes[k] * v}
   order_summary + "Final bill: £#{bill}"
  end

  def not_on_menu?(dish)
    !menu.dishes.include?(dish)
  end

  def new_order
   @order = order_klass.new
  end

  def order_summary
    summary = ''
    @order.current_order.each do |k, v|
      cost = @menu.dishes[k] * v
      summary << "#{k} x #{v}: total £#{cost.round(2)}\n"
    end
    summary
  end

end
