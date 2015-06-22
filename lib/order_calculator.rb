module OrderCalculator


  def add_to_total item, amount
    total_per_item = @menu[item] * amount
    @total += total_per_item
  end

  def add_to_order item, amount
    select_item = @menu.select { |k| k == item }
    @order << {item: select_item.keys[0], amount: amount, price: "£#{select_item.values[0] * amount}" }
  end

  def on_menu? item
    @menu.has_key?(item)
  end

  def no_items_ordered?
    @order.empty?
  end

end
