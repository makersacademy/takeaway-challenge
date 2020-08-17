class Menu

  def initialize
    @items = { "spring rolls": 1.99, "prawn crackers": 1, "egg fried rice": 2.50,
    "sweet and sour chicken": 4.99, "chow mein": 2.50, "beef in black bean": 4.99 }
  end

  attr_accessor :items

  def view
    @items.each { |item, price| puts "#{item}....£#{price}" }
  end

  def price(item)
    @items[item.to_sym]
  end

  def on_menu?(item)
    @items.include?(item.to_sym)
  end

end
