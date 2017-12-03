class Order
  attr_reader :menu, :items
  def initialize(menu = Menu.new)
    @items = []
    @menu = menu
  end

  def add_to_order(item)

  end
end
