class Restaurant 
  
  
  def initialize(cuisine="Italian")
    @cuisine = ""
    @menu = {Pizza: 10.00, Pasta: 8.00, Milanese: 14.00}
  end

  def own_menu
    @menu.each_pair { |key, value| puts "#{key} = £#{value.round(2)}"}
  end
  
  
end
