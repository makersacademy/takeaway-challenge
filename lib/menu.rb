class Menu
  attr_reader :menu_items

  def initialize(menu_items = {
    "Cheese Burger" => 9.00,
    "Bacon Cheese Burger" => 10.00,
    "Vegan Burger" => 8.50,
    "Mac Balls" => 6.00,
    "French Fries" => 3.50,
    "Halloumi Fries" => 6.50
  })
    @menu_items = menu_items
  end

  def show_menu
    # Formats each item as "Item:    £0.00"
    menu_items.each { |name,price| puts "#{name}:    £#{format("%.2f", price)}" }
  end

  def has_item?(item)
    menu_items.key?(item)
  end

  def price(item)
    raise "Item not on the menu" if !has_item?(item)
    menu_items[item]
  end

end

