require_relative 'list'

class Restaurant

  def initialize
    @menu = List.new
  end

  def view_menu(menu_file = nil)
    menu_file.nil? ? menu.view_items : menu.view_items(menu_file)
  end


  private

  attr_reader :menu, :waiter

end
