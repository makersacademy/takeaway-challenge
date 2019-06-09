class Takeaway

  def initialize(menu:)
    @selection = []
    @menu = menu
  end

  def show_menu
    @menu
  end

  def select(item, qty)
    @selection << { dish: item, qty: qty }
  end

  def order_summary
    calculate_bill
  end

  private

  attr_reader :menu

  def calculate_bill
    i, summary = 0, 0
    until i == @selection.count do
      summary += @selection[i][:qty] * menu[@selection[i][:dish]]
      i += 1
    end
    summary
  end

end
