module OrderPrinter

  def self.output_total(total)
    "\nThe total is £#{sprintf('%.2f', total)}"
  end

  def self.collate_output(dish, hash)
    "#{dish} x #{hash[:quantity]} (£#{sprintf('%.2f',
                                      hash[:price] * hash[:quantity])}), "
  end

  def self.output_orders(basket)
    output = ""
    basket.each_pair do |dish, hash|
      output << collate_output(dish, hash)
    end
    output.chomp(", ")
  end

  def self.print_order(basket, total)
    OrderPrinter.output_orders(basket) +
        OrderPrinter.output_total(total)
  end

end
