class Order

  def initialize(dish, quantity)
    @added_to_order = [{dish => quantity}]
    @total = 0
  end

end
