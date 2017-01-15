class Order

attr_reader :basket, :order

  def initialize()
    @basket = []
  end

  def add(dish, quantity)
    @basket << (@order = {:quantity => quantity, :dish => dish})
    print_order
  end

  private

  def print_order
    quantity, dish = order[:quantity], order[:dish]
    "#{quantity}x #{dish}(s) added to your basket"
  end

end
