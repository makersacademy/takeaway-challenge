class Menu
  attr_reader :menu

  def initialize
    @menu = []
  end

  def add_items(item, price)
    @menu << {key: @menu.size + 1, name: item, price: price}
  end
end
