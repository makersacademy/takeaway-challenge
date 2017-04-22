class Order

  def initialize(menu = nil, print_output = Print.new)
    @menu = menu
    @items = Hash.new(0)
    @print_output = print_output
  end

  def add(dish, count = 1)
    @items[dish] += count
    @print_output.add_to_basket(dish)
  end

  private

  attr_reader :items

end
