require 'customer'
class Resturant
attr_reader :choice
  def initialize
    @dishes = [{"Chips" => 2.50, "Garlic Bread" => 3.50, "Hot Dog" => 4.50, "BBQ Wings(4)" => 5.50}]
    @sum = 0
    @choice = []
  end 
  
  def dish 
    @dishes
  end 
  def customer_choice (choice)
   p @choice << choice
  end 

  def total
    @dishes[0].each do |dish, price|
      @choice[0].each do |x|
        if x == dish 
          @sum += price
        end 
      end 
    end 
    @sum
  end 
end