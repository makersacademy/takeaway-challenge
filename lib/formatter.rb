class Formatter

  def format_items(items)
    items.map { |item| "#{item.name} --- £#{item.price}\n" }
  end

  def format_price(number)
    "£#{number}"
  end
end
