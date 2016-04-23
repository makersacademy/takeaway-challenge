class Takeaway

  def initialize(menu)
    @menu = menu
    # @order = order
  end

  def show_menu
    @menu.print_menu
  end
end