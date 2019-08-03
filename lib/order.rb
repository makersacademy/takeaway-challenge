
class Order


attr_reader :order, :selection, :menu


def initialize
  @order = []
  @selection = {}

end

  def show_order
    @order
  end

  def add(item)
    @item = item
    @price = Printed_menu::PRINTED_MENU[@item]
    @selection[@item] = @price
    @order << @selection
    @selection = {}
  end




end
