
class Order


attr_reader :order, :menu


def initialize
  @selection = {}
  @order = []

end

  def show_order
    @order
  end

  def add(item, quantity)
    @item = item
    @quantity = quantity
    @price = Printed_menu::PRINTED_MENU[@item]

    @selection.store("item", @item)
    @selection.store("price", @price)
    @selection.store("quantity", @quantity)
    @order << @selection
    @selection = {}
  end

  # def place_order
  #
  #
  # end




end
