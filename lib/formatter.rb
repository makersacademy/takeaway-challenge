class Formatter

  def format_menu(dishes)
    dishes.map do |dish, price|
      "#{dish} - #{format(price)}"
    end
  end

  private

  def format(price)
    "£%.2f" % price
  end
end
