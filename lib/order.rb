# require 'take_away_menu'

class Order

  attr_reader :add_item, :list_of_items, :menu, :item

def initialize
  @list_of_items = []
  @menu = TakeAwayMenu.new
end

  def add_item(item)
  # @item = item
  @menu.items.assoc(item)
  end

end
