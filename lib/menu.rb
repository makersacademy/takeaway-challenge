class Menu
attr_reader :items

  def initialize(items)
    @items = items
  end

  def list
    items.map do |items, price|
    "%s £%.2f" % [items.to_s.capitalize, price]
  end.join(", ")
  end
end
