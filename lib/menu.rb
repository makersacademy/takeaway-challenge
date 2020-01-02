class Menu

  attr_reader :items
  
  def initialize(items)
    @items = items
  end

  def prints
    menu = items.map do |item, price|
      "#{item} £#{price}"
    end
    menu.join(", ")
  end

  def include_item?(item)
    !!items[item]
  end

end
