require_relative 'menu'
require_relative 'order'

class TakeAway

  def initialize(menu)
    @menu = menu
  end

  def see_menu
    menu.print
  end

  private

  attr_reader :menu

end
