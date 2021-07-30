class Takeaway

  attr_reader :MENU, :order
  MENU = { "brocolli" => 3, "risotto" => 10, "bread" => 5 }

  def initialize
    @order = []
    @menu = MENU
    @order_total = 0
  end

  def read_menu
    MENU
  end

  def select(pick)
    @order << MENU.select { |key| key == pick }
  end

  def total
    @order.each { |selection|
      selection.each_value { |value| @order_total += value }
    }
    p @order_total
  end

  def check_total
    total
    "Your order was #{@order}. Your total was #{@order_total}."
  end

end
