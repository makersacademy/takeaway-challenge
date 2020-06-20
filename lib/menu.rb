class Menu 
  
  attr_reader :menu
  
  def initialize
    @menu = [
      { :item => "food1", :price => "1.00" },
      { :item => "food2", :price => "2.00" }]
  end
  
  def return_price(item)
    @menu.find { |x| x[:item] == item }[:price]
  end
  
end
