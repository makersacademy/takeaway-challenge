class Order

  def initialize(print_output = Print.new)
    @items = Hash.new(0)
    @print_output = print_output
  end

  def add(dish, quantity = 1)
    @items[dish] += quantity
    @print_output.add_to_basket(dish)
  end

end
