require_relative 'order'

class Restaurant

  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  # def finalise_out_order()

  # attr_reader :menu_list, :ordered_items
  #
  # def initialize(menu_list = {})

  # end
  #
  # def order(*items)
  #   @ordered_items = items
  # end
  #


end
