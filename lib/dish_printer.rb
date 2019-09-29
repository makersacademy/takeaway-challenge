module DishPrinter

  def print_dish(name, price)
    "#{name} (£#{price})"
  end

  def print_menu(items)
    items.map { |item|
      "#{print_dish(item[:name], item[:price])}"
    }.join('\n')
  end

  def print_order(items)
    items.map { |item|
      dish = print_dish(item[:name], item[:price])
      quantity = item[:quantity]
      "#{dish} - #{quantity}"
    }.join('\n')
  end

  def print_total(total)
    "Order Total: £#{total}"
  end
end
