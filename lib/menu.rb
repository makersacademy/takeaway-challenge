class Menu
  attr_reader :menu
  def initialize
    @menu = [
      { :item => "fried rice", :price => 3.50 },
      { :item => "sweet and sour pork", :price => 4.00 }, { :item => "spring rolls", :price => 3.00 }
    ]
  end
  def price(item)
    @menu.find { |x| x[:item] == item}[:price]
  end  
end
