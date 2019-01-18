class Formatter
  def initialize(items)
    @items = items
  end

  def format_items
    @items.map { |item| "#{item.name} --- £#{item.price}\n" }
  end
end
