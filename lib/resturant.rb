require 'customer'
class Resturant
attr_reader :choice
  def initialize
    @dishes = [{"Pasta" => 5, "Mac&Cheese" => 4, "Kimchi" => 3, "Pizza" => 5, "Burger" => 3.5}]
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