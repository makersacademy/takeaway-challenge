class Printer
  def display_menu(name, price)
    print "#{name_and_price(name, price)}\n"
  end

  def format_order(name, price, qty, subtotal)
    print "#{name_and_price(name, price)}#{format_qty(qty)}"\
    "#{format_price(subtotal)}\n"
  end

  def format_total(total)
    print "Total:\t#{format_price(total)}\n"
  end

  private

  def format_qty(qty)
    "\tx#{qty}\t"
  end

  def name_and_price(name, price)
    format_name(name) + format_price(price)
  end

  def format_name(name)
    "#{name.ljust(15, ' ')}"
  end

  def format_price(price)
    "£%.2f" % (price / 100.00)
  end
end
