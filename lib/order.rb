
class Order


attr_reader :order, :menu, :total


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


  def place_order

    array_of_prices = @order.map{|h| (h[ "price"] * h[ "quantity"])}
   @total = array_of_prices.sum

   "Here is your order #{@order}, the total is #{@total}"
    end



  # def place_order
  #   @total
  # #  "Here is your order #{@order}, the total is #{@total}"
  # end
end
