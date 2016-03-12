
class Order
  attr_reader :basket

  def initialize
    @basket = {}
  end

  def add_to_basket(selection, quantity)
    number = 0
    while number < quantity
      basket.merge!(selection)
      number +=1
    end
  end


end
