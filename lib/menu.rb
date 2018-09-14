class Menu 
  attr_reader :dishes

  def initialize
    @dishes = {
      'Pizza' => 10,
      'Chips' => 4,
      'Burger' => 7,    
    }              
  end

  def show_dishes
    dishes.each do |dish, price|
      puts "#{dish}:  #{price}"
    end
  end  

end
