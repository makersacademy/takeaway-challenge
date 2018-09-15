class Printer
  def display(name, price)
    print format_name(name) + format_price(price)
  end

  private

  def format_name(name)
    "\u2022 #{name.ljust(20, ' ')}"
  end

  def format_price(price)
    "£%.2f\n" % (price / 100.00)
  end
end
