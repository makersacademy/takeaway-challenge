# Basket class
# instance initiated with empty contents list
# instance initiated with zero total 
# can have items added to it via Menu object
# can be asked to view its contents
# can be asked to check total
# can be asked to complete order

class Basket
  attr_reader :basket_contents, :basket_total

  def initialize
    @basket_contents = []
    @basket_total = 0
  end

  def add_to_basket(dish)
    @basket_contents << dish
    @basket_contents
  end

end
