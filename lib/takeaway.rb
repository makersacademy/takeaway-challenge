require_relative "menu"

class Takeaway
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    print @menu.list
  end
end
