class Menu

  attr_reader :dishes

  DISHES = {
    "Chicken Korma" => 6.75,
    "Lamb Bhuna" => 7.25,
    "Basmati Rice" => 2.00
  }

  def initialize(dishes = DISHES)
    @dishes = dishes
  end
    
  def print 
    DISHES.each do |dish, price|
      puts "#{dish}: £#{'%.2f' % price}"
    end
  end
  
end
