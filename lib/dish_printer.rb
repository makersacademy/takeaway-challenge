module DishPrinter
  
  def order_header
    something
  end
  
  def menu_header
    something
  end

  def print_dish(name:, price:)
      "#{name} (£#{price})"
  end

  def print_order(items)
    items.map { |item|
      dish = print_dish(name: item[:dish], price: item[:price])
      quantity = item[:quantity]
      "#{dish} - #{quantity}"
    }.join('\n')
  end

  def print_total(total)
    "Order Total: £#{total}"
  end


end