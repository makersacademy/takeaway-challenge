require_relative './menue'
require_relative './dish'


class Basket 
  attr_reader :basket, :total_cost, :menue_for_reading
   
  def initialize
    @basket = [] 
    @total_cost = 0
    @menue = Menue.new
  end 
    
  def add_to_basket(menue_number) 
    @menue.menue.each { |dish| 
      if dish.menue_number == menue_number
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
  
  def place_order
    # twilio stuff which.
    print "Your order has been placed. The total comes to: £ " 
    check_total
  end
  
  private 

  def check_total
    basket_total = 0
    @basket.each { |dish| basket_total += dish.cost }
    @total_cost == basket_total ? (return basket_total) : nil
  end 
  
  def add_cost(cost)
    @total_cost += cost
  end 
end 
