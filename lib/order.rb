class Order

  attr_accessor :items
  attr_reader :menu

  def initialize(menu)
    @items = Hash.new(0)
    @status = :new
    @menu = menu
  end

  def add_dish(dish, quantity = 1)
    @items[dish] = 0 unless items[dish]
    @items[dish] += quantity
  end

  def remove_dish(dish)

  end

  def order_total

  end

  def finalize_order

  end

end
