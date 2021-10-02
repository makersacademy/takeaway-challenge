
class Menu 

  attr_accessor :dishes 

  def initialize
    @dishes = {
      "cheese pizza"=>12.99, 
      "pepperoni pizza"=>13.99, 
      "vegan pizza"=>14.99, 
      "12 wings"=>6.99, 
      "16 wings"=>8.99, 
      "drink"=>1.09 
    }
  end
end
