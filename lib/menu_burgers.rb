
class Menu 

  attr_accessor :dishes 

  def initialize
    @dishes = {
      "single burger"=>7.99, 
      "double burger"=>8.99, 
      "bacon burger"=>9.49, 
      "chips"=>2.99, 
      "drink"=>1.19 
    }
  end
end
