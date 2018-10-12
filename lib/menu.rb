class Menu 
  attr_reader :dishes
  def initialize 
    @dishes = [
    	{ item: 'Spaghetti', price: 5 }, 
      { item: 'Pizza', price: 4 }
      ]  
  end
    
  def list 
    @dishes.each_with_index { |value, index|
      puts "#{index + 1}. #{value[:item]} £#{value[:price]}"
    }
  end
end
