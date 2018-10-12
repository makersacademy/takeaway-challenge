class Menu
  attr_reader :menu_items

  def initialize(menu_items = { 'pizza' => 6.99, 'chips' => 1.50, 'burger' => 3.00 })
    @menu_items = menu_items
  end
end
