# require 'take_away_menu'
#
class Order

  attr_reader :add_item, :list_of_items, :menu, :item

  def initialize
    @list_of_items = []
    @menu = TakeAwayMenu.new
  end

  def add_item(item)
    selected_items = @menu.items.assoc(item)
    @list_of_items << Hash[*selected_items]
  end

end



# class Order
#
#   attr_reader :add_item, :list_of_items, :menu, :item, :amount, :cost
#
# def initialize
#   @list_of_items = []
#   @menu = TakeAwayMenu.new
# end
#
#   def add_item(item, amount=1)
#     individual_item = {item: item, cost: cost, amount: amount}
#   @list_of_items << individual_item
#   end
#     # logged_item = amount.times(@menu.items.assoc(item))
#     # @list_of_items << Hash[(*logged_item.flatten)
#
# end
