class Takeaway
  attr_reader :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
    @total = 0
  end

  def display_menu
    @menu.print
  end
end
