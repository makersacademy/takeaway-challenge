class Menu
  attr_reader :menu_items

  @@default_menu = { 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3 }
  # Not sure if I like this class having a default menu
  # May be better to require a menu to be passed at initilization

  def initialize(menu_items = @@default_menu)
    @menu_items = menu_items
  end

  def on_menu?(dish)
    menu_items.include?(dish)
  end
end
