class Menu

  LIST_DISHES = [
    { name: "spaghetti", price: 7, quantity: 0 },
    { name: "meatball", price: 6, quantity: 0 },
    { name: "pizza", price: 9, quantity: 0 }]

  def initialize(dishes = LIST_DISHES)
    @dishes = dishes
  end

  def available_dishes
    @dishes.select { |dish| dish[:quantity] > 0 }
  end

 private
 attr_reader :dishes

end
