class Restaurant 
  
  attr_reader :menu
  
  def initialize(cuisine="Italian") 
    @cuisine = cuisine 
    @menu = { "Pizza"=> 10.00, "Pasta"=> 8.00, "Milanese"=> 14.00} 
  end 

  def own_menu
    @menu.each_pair { |key, value| puts "#{key} = £#{value.round(2)}"}
    "Please order from the menu above:"
  end
  
  
end
