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

end
