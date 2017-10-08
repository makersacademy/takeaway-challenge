require_relative 'menu'

class Ordering

  attr_reader :selected_dishes

  def initialize(menu = Menu.new)
    @menu = menu
    @selected_dishes = []
  end

  def selection(items, quantity = 1)
    fail "Sorry that item isn't on the menu! Please choose from the menu." unless @menu.menu_items.include?(items)
    quantity.times { @selected_dishes << items }
  end

  def view_dishes
    print selected_dishes
    p"You have ordered #{selected_dishes.count} dishes."
  end

end
