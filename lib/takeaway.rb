require_relative 'menu'

class Takeaway

  include Menu

  def menu
    print format_menu_items
  end
end
