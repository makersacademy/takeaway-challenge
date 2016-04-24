class Menu
    
  attr_reader :dishes  
  def initialize
   	@dishes = {
   		"pizza"=>1,
   		"Berger"=>2
   	}
  end	

  def print_dish
  	dishes
  end

  def present? item
  	dishes.include? item
  end
 
end
