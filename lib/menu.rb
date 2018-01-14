class Menu

  CHINESE_MENU_ITEMS = { "Prawn Toast" => 4.50, "Fried rice" => 3.00,
                        "Beef Chow mein" => 6.00, "Salt and Pepper King Prawn" => 7.00 }
  INDIAN_MENU_ITEMS = { "Vegetable Samosa" => 3.00, "Tarka dal" => 5.00,
                        "Saag Paneer" => 6.00, "Pilau Rice" => 3.00 }
  attr_reader :items

  def initialize
    @items = {}
  end

  def add_items_from_hash(hash)
    @items = hash
  end

  def add_items(item, price)
	   @items[item] = price
  end

  def print_menu
    fail "No items added to menu" if items.empty?
    # separation of concerns needs to be considered further
    items.each { |k, v| puts "#{k}, price £#{v}0" }
  end

  def item_available?(item)
    items.has_key?(item)
  end
end
