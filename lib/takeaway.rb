

class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order 
  end

  def print_menu
    menu.print
  end

  private
  attr_reader :menu

end
