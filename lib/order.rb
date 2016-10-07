require_relative 'menu'
require_relative 'selection'

class Order
  attr_reader :menu, :selection

  def initialize (menu = Menu.new)
    @menu = menu
  end

  def view_menu
    menu.print_menu
  end

  def select_items(selection = Selection.new(menu))
    @selection = selection
    selection.select
  end

  def review
    selection.review 
  end

end
