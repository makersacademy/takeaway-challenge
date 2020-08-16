class Menu

  def initialize
    @items = { "spring rolls": 1.99 }
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
