class Basket
  attr_accessor :items

  def initialize
      @items = []
  end  

  def add(dish)
    items << dish
  end

  def checkout
    # calls on order.process which then calls order.complete or order.fail
    # order.process returns true or false if complete or not with error message
    # if order call good order will store this info in user account order history
    # if all good, basket.clear
  end  
  
  def total
    items.inject(0) do |sum, hash| 
      total = hash[:price] * hash[:quantity]
      sum + total
    end
  end

  def clear
  end

end
