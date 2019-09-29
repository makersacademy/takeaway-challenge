class Menu
  attr_reader :items

  def initialize
    @items = { pizza: 6, burger: 5, fries: 3, milkshake: 3, soda: 1 }
  end

  def view_items
    print "MENU:\n" + @items.map { |food, price|
      "#{food.capitalize} -- £#{price}"
    }.join("\n")
  end
end
