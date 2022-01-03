class Menu 
  attr_accessor :dishes

  DEFAULT_DISHES = {
  'Burger'=>5.75,
  'Coke'=>1.50,
  'Fries'=>2.25
  }
def initialize (dishes = DEFAULT_DISHES) 
  @dishes = dishes 
end

  def print
    @dishes.each_with_index do |(dish, price), idx|
      puts "#{idx + 1}. #{dish}. Price: £#{price} "
    end
  end

end