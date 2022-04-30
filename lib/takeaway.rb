class Takeaway
  attr_reader :menu, :current_order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def display_menu
    menu.display_available_dishes
  end

  private


end