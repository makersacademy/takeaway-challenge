
class Takeaway
  attr_reader :menu
  def initialize(menu: menu)
    @menu = menu
  end

  def view_menu
    @menu.display
  end

end
