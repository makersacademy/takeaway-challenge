require_relative 'menu'

class Ordering

  attr_reader :menu_items, :selected_dishes, :view_menu

  def initialize(menu = Menu.new)
    @menu = menu
    @selected_dishes = []
  end

  def selection(items)
    fail "Sorry that item isn't on the menu! Please choose from the menu." unless @menu.menu_items.include?(items)
    @selected_dishes << items
  end

end
