require_relative 'menu'

class TakeAway

  def initialize
    @menu = Menu.new
  end

  def view_menu
    menu.items
  end

  private
  attr_reader :menu

end
