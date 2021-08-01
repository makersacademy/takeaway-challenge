class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def display_menu
    menu.print
  end

  def place_order(food)
  end


  private

  attr_reader :menu

end
