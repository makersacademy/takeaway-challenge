class Takeaway

attr_reader :basket

  def initialize
    @basket = []
  end

  def place_order(dish, quantity)
    basket << {dish: dish, quantity: quantity}
  end

end



# twillio number +441492233118
