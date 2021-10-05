class Menu
 attr_reader :dishes

 def initialize
  @dishes = [ 
  {Margherita: 8.99},
  {Salami: 9.99},
  {Hawaiiaan: 9.99},
  {Chips: 4.99} 
]
 end
  

  def print_dishes
     @dishes.each_with_index do |(key, value), index|
      puts "#{index+1}, #{key.to_s.capitalize}, #{value}\n"
    end
  end
end
 




