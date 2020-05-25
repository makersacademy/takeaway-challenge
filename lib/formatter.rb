class Formatter

  def format_menu(dishes)
    dishes.map { |dish, price| "#{dish} - #{format(price)}" }
  end

  def format_order(selection)
    selection.map { |dish, quantity| "#{dish} x#{quantity}" }
  end

  def format_total(amount)
    "Total: #{format(amount)}"
  end

  private

  def format(price)
    "£%.2f" % price
  end
end
