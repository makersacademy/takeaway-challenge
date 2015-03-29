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
  end
end
