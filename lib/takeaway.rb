class Takeaway
  def initialize(menu)
    @menu = menu
  end

  def view_menu
    menu.items
  end

  private
  attr_reader :menu

end
