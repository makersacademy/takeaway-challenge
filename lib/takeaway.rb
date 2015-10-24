class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def read_menu
    @menu.read
  end

  def add(itm, qty=1)
    @order.add_to_basket(itm, qty)
    "#{qty}x #{itm}(s) added to your basket."
  end

  def basket_summary
    @order.basket_sum(@menu)
  end

  def total_cost
    @total = @order.total_bill(@menu)
    "Total Cost: £#{@total}"
  end



end
