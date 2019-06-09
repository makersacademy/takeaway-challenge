class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def show_menu
    @menu.print_menu
  end

  def order_summary(order)

    i, summary = 0, 0
    until i == order.count do
      summary += order[i][:qty] * @menu.dishes[order[i][:dish]]
      i += 1
    end
    summary
  end

  private

  attr_reader :menu

end
