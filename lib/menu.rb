class Menu 

  attr_reader :dishes
  
  def initialize(dishes)
    @dishes = dishes
  end

  def print 
    @dishes.map { | dish, price | 
    "%s: £%.2f" % [ dish, price ]
    }.join(", ")
  end

  def has_dish?(dish)
    !!dishes[dish]
  end

  def price(dish)
    dishes[dish]

  end



end
