# new class 'Menu'
class Menu
  attr_reader :menu_items

  def initialize
    @menu_items = {
      'pizza' => 10,
      'pasta' => 7,
      'garlic bread' => 4
    }
  end

  def display_items
    items = ""
    @menu_items.each { |item, price| items += "#{item.capitalize} : £#{price}\n" }
    items
  end
end
