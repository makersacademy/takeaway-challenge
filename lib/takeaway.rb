class Takeaway
  def initialize(menu)
    @menu = menu
  end

  def view_menu
    menu.items
  end

  def order(selection, quantity = 1)
    item = menu.order(selection)
    OrderItem.new(item, quantity)
  end


  private
  attr_reader :menu

end
