class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def show_menu
    @menu.print_menu
  end

  def order_summary(order)
    order.reduce(0) do |total, line_item|
      price = @menu.dishes[line_item[:dish]]
      total + line_item[:qty] * price
    end
  end

  private

  attr_reader :menu

end
