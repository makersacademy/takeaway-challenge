class Menu
    
  attr_reader :dishes  
  def initialize
   	@dishes = {
   		"pizza"=>1,
   		"burger"=>2,
      "fries"=>1.5
   	}
  end	

  def print_dish
  	dishes
  end

  def present? item
  	dishes.include? item
  end
 
end
