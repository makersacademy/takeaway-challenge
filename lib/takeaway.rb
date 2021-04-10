class Takeaway

  attr_reader :items, :shoppingcart

  def initialize
    @items = {margarita: 8.99, vegetarian: 9.99, pepperoni: 10.99, cheesecake: 3.99, water: 0.99}
    @shoppingcart = []
  end

  def add(value)
    @shoppingcart << @items[value.to_sym] #stuck trying to convert it over to being a symbol
  end

end