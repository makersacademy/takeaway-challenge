class Order

attr_reader :quantity, :item, :new_order, :order

  def initialize
    @quantity
    @item
    @new_order = {}
    @order = []
  end

  def add_items_to_order(item, quantity)
    @order << @new_order
  end

  # def order_confirmation(item, quantity, price)
  #   order = "You have ordered #{@quantity} portion of #{@item} at a total cost of £#{@total_cost}"
  # end

end
