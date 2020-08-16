class Menu

  def initialize
    @items = { "spring rolls": 1.99, "chow mein": 3.99, "egg fried rice": 2.99,
      "sweet and sour chicken": 4.99, "beef in black bean sauce": 4.99 }
  end

  attr_reader :items

  def view
    @items.each { |item, price| puts "#{item}....£#{price}" }
  end

  def price(item)
    @items[item.to_sym]
  end

end
