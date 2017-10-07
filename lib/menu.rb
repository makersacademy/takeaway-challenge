#new instance of menu class
class Menu
  attr_reader :menu_items

  def initialize
    @menu_items = {
      :pizza => 10,
      :pasta => 7,
      :garlic_bread => 4
    }
  end

  def display_items
    items = ""
    @menu_items.each { |food, price| items += "#{food.capitalize} : £#{price}\n" }
    items
  end
end
