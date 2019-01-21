class Takeaway

  def initialize(menu, order)
    @menu = menu
    @order = order
  end

  def show_menu
    @menu.see_menu
  end

end
