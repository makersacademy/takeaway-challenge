class Order

  def initialize(print = Print.new)
    @items = Hash.new(0)
    @print = print
  end

  def add(dish, quantity = 1)
    @items[dish] += quantity
    @print.add_to_basket(dish, quantity)
  end

  def total(input)
    input
  end

  def basket(menu)
    @items.each do |dish, quantity|
      price = menu.cuisine[dish] * quantity
      @print.view_basket(quantity, dish, price)
    end
  end

end
