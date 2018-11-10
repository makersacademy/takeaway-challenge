class Order
  attr_reader :basket
  def initialize(menu)
    @menu = menu
    @basket = {}
  end

  def add(item)
    @menu.list.select do |dish, price|
      @basket[item] = price if item == dish
    end
  end

end
