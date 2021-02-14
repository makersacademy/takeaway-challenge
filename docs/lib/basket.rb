require_relative './menue'
require_relative './dish'

class Basket 
  attr_reader :basket, :total_cost, :menue_for_reading
   
  def initialize
    @basket = [] 
    @total_cost = 0
    @menue_for_reading = Menue.new
  end 
    
  def add_to_basket(menue_number_or_name) 
    @menue_for_reading.menue.each { |dish| 
      if dish.menue_number == menue_number_or_name
        @basket << dish 
        add_cost(dish.cost)
      end 
    } 
  end
    
  def add_cost(cost)
    @total_cost += cost
  end 
    
end 
