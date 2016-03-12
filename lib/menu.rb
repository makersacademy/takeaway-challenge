class Menu

  MENU_ITEMS = {
    'Beef burger' => 8.5,
    'Cheese burger' => 9,
    'Chicken burger' => 9.5,
    'Vegetable burger' => 7.5,
    'Chips' => 3.25,
    'Onion rings' => 3.5,
    'Coleslaw' => 3,
    'Side salad' => 3,
    'Sauce' => 1
  }.freeze

  def initialize
    @menu = MENU_ITEMS
  end

  def view
    MENU_ITEMS.each{|key,value| puts "#{key}: £#{value}"}
  end

  def price (item)
    MENU_ITEMS[item]
  end

end
