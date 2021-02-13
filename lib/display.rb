class Display
  def view_menu(menu)
    menu.map { |meal, price| "#{meal.to_s.capitalize}: #{format(price)}" }
  end

  def view_order(order)
    output = order.map { |meal| view_menu(meal).pop }
    output << "Total: #{format(total(order))}"
  end

  def confirm_added(meal)
    "#{meal.capitalize} has been added to your order 🍕"
  end

  private

  def total(order)
    order.map(&:values).map(&:pop).sum
  end

  def format(amount)
    "£%.02f" % amount
  end
end
