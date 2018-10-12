class Order
  attr_accessor :total

  def initialize(menu = Menu.new)
    @total = 0
    @menu = menu
  end

  def add(item)
    @total += @menu.items[item]
  end
end
