class Order

attr_reader :basket

  def initialize
    @basket = []
    @selection = {}
  end

  def add_dish(dish, quantity)
    @selection = {dish => quantity}
    @basket << @selection
    return "#{quantity} x #{dish}(s) added to your basket."
  end

end
