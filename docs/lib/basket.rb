require_relative './menue'
require_relative './dish'

class Basket 
  attr_reader :basket, :total_cost, :menue_for_reading
   
  def initialize
    @basket = [] 
    @total_cost = 0
    @menue = Menue.new
  end 
    
  def add_to_basket(menue_number_or_name) 
    @menue.menue.each { |dish| 
      if dish.menue_number == menue_number_or_name
        @basket << dish 
        add_cost(dish.cost)
      end 
    } 
  end
  
  def show_basket
    @basket.each { |dish| 
      puts "#{dish.name} -- £#{dish.cost}"
    }
    puts "Total Cost: £#{total_cost}"
  end 
  
  private 
  
  def add_cost(cost)
    @total_cost += cost
  end 
end 
