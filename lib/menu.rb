class Menu
  attr_reader :menu_items

  @@default_menu = { 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3 }

  def initialize(menu_items = @@default_menu)
    @menu_items = menu_items
  end

  def on_menu?(dish)
    menu_items.include?(dish)
  end
end
