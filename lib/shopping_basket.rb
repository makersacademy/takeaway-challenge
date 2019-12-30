require_relative 'menu'

class ShoppingBasket

  attr_accessor :basket, :add_item

  def initialize
    @basket = []
    # @total 
  end 

  def add_item(selection)
    @basket << selection
  end 

  # def totaliser
  #   @basket
  # end 
  
end 