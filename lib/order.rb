class Order

  attr_reader :basket

  def initialize
    @basket = {}
  end

  def add_dish(number, menu)
    dish = Dish.new(number, menu)
    name = dish.get_name(number, menu)
    if basket.key?(name)
      basket[name] += 1
    else
      basket[name] = 1
    end
  end






end
