require_relative "menu.rb"
require_relative "dish.rb"
require_relative "menu_lister.rb"

class Takeaway

  attr_reader :menu

  def initialize(menu, lister_module)
    @menu = menu
    @lister = lister_module
  end

  def show_menu
    print @lister.list(@menu)
  end

  def place_order

  end

end
