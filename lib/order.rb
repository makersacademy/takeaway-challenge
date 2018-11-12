class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @basket = Hash.new
    @menu = menu.dishes
  end

  def add_order(item, quantity)
    @menu.each do |dish, price|
      @basket[dish] = price, "x#{quantity}" if item == dish
    end
  end

end
