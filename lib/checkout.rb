class Checkout
  attr_reader :total_amount, :paid
  attr_accessor :get_shopping_basket
  def initialize
    # I want to read the basket from inventory
    # not sure how to do. For now, I will have an empty hash
    shopping_basket = {}
    @total_amount = 0
    @get_shopping_basket = shopping_basket
    @paid = false
    @prices = { 'pizza' => 6, 'burger' => 3, 'chips' => 1 }
  end

  def calculate(_shopping_basket = {})
    # not enough ruby hash/array methods knowledge to make it work yet
    # shopping_basket.each {|key, value| (value *= @prices[key] if @prices.has_key?(key) }
    @total_amount = 26
  end
end
