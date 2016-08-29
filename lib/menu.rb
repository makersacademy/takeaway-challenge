class Menu
#shows list of dishes and prices
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def print_menu
      items.map { |item,price| "%s £%.2f" [item.to_s, price] }.join(", ")
  end

  def has_item?(item)
    !!items[item]
  end

  def price(item)
  items[item]
  end

end
