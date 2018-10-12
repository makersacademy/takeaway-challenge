require_relative 'menu'

class Takeaway

include Menu

  def initialize
    # p @menu
    # @menu = menu
  end

  def menu
    print format_menu_items
  end
end
