class Menu
  attr_accessor :order_list
  
  def initialize
    @order_list = []
  end 

  def list 
    list = {
      'Sushi' => 5.90,
      'Kim Chi' => 4.90,
      'Crispy Pork Belly' => 11.90,
      'Lobster and Egg Noodles' => 40.00
    }
  end 

  def add(item)
    @order_list.append(item => list[item])
  end 
end 
