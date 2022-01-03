class Menu
  attr_accessor :order_list
  
  def initialize
    @order_list = []
  end 

  def list 
    list = {
      'Sushi' => 5,
      'Kim Chi' => 4,
      'Crispy Pork Belly' => 11,
      'Lobster and Egg Noodles' => 40
    }
  end 

  def add(item)
    @order_list << { item => list[item] }
  end 

  def total
    @order_list.inject(0){|sum, hash| sum+= hash.values.join.to_i}
    #find the right way to add hash values in arrayz``
  end 

end 
