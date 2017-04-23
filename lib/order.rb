class Order

  def initialize(print = Print.new)
    @items = Hash.new(0)
    @print = print
  end

  def add(dish, quantity = 1)
    @items[dish] += quantity
    @print.add_to_basket(dish, quantity)
  end

  def basket(menu)
    @print.view_basket(@items, menu)
  end

  def total(input)
    input
  end

end
