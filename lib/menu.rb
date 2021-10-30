class Menu

  attr_reader :order, :total, :order_summary
  def initialize
    @menu = { "egg fried rice" => 2,"special fried rice" => 2,"prawn toast" => 2,
      "chicken balls" => 2.5,"spring rolls" => 2.5,"char siu pork" => 3,
      "beef chow mein" => 3.5,"spare ribs" => 3.5 }
    @order = []
    @order_summary = ""
    @total = 0
  end

  def show_menu
    @menu
  end

  def add_item(item, amount = 1)
    # @order[item] = amount
    @order << "#{amount}x #{item} ordered (£#{@menu[item] * amount})"
    calculate_total(item, amount)
  end

  def calculate_total(item, amount)
    @total += @menu[item] * amount
  end

  def show_order_summary
    @order_summary = "#{@order.join(', ')}\nTotal: £#{@total}"
  end
end
