class Takeaway
  attr_reader :list, :order

  def initialize
    @list = { "Dish 1" => 1.00,
              "Dish 2" => 2.00,
              "Dish 3" => 3.00 }
    @order = []
  end

  def menu
    list
  end

  def choose(dish, quantity=1)
    quantity.times do
      list.select { |k,v| order.push([k, v]) if k == dish }
    end
  end

end
