require_relative 'menu'

class Order

  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def add_item(menu, item_key)
    @basket << menu.return_item(item_key)
  end
end
