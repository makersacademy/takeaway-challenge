class Takeaway

  attr_reader :items, :shoppingcart

  def initialize
    @items = {margarita: 8.99, vegetarian: 9.99, pepperoni: 10.99, cheesecake: 3.99, water: 0.99}
    @shoppingcart = []
  end

end