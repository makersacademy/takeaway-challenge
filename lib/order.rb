require 'restaurant'

class Order

  DEFAULT_BILL = @food_cost
  MENU = Restaurant::MENU

  attr_reader :dishes, :total_bill


  def initialize(total_bill = 0)
    @dishes = []
    @total_bill = total_bill
  end

  def take_order
    puts "What would you like to eat?"
    puts "Hit enter again to finalise your choice."

  end

  def add_cost
    
  end

  def show_order

  end

  def order_total

  end

end
