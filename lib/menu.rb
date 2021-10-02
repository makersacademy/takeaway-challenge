
class Menu 

  attr_accessor :dishes 

  def initialize
    @dishes = {
      "pizza"=>12.99, 
      "burger"=>5.99, 
      "party pack"=>19.99, 
      "12 wings"=>6.99, 
      "drink"=>1.09 
    }
  end
end
