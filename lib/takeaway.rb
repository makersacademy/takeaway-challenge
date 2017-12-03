require_relative "./menu.rb"

class TakeAway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    @menu.show_dishes
  end

end
