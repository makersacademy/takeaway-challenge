class Menu
  attr_reader :menu_items

  def initialize
    @menu_items = {
      "Cheese Burger" => 9.00,
      "Bacon Cheese Burger" => 10.00,
      "Vegan Burger" => 8.50,
      "Mac Balls" => 6.00,
      "French Fries" => 3.50,
      "Halloumi Fries" => 6.50
    }
  end

  def show_menu(menu_items = @menu_items)
    # Formats each item as "Item:    £0.00"
    menu_items.each { |name,price| puts "#{name}:    £#{format("%.2f", price)}" }
  end
end
