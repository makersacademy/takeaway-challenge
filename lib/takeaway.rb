require_relative 'menu_display'
require_relative 'order'

class Takeaway

  attr_reader :menu_display

  def initialize
    @menu_display = Menu_Display.new
  end

  def show_menu
    @menu_display.show
  end

  def order

  end
end
