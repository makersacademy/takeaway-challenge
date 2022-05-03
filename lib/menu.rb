class Menu
  
  attr_reader :menu
  
  def initialize
    @menu = [
      { :item => 1, :dish => "Mattar Paneer", :price => 12.50 },
      { :item => 2, :dish => "Black Daal", :price => 7.50 },
      { :item => 3, :dish => "Raita", :price => 3.50 },
      { :item => 4, :dish => "Garlic Naan", :price => 3.50 }
    ]
  end
  
  def view 
    @menu.map { |dish| "#{dish[:item]}. #{dish[:dish]} £#{dish[:price]}" }
  end

  def existing_dish(number, qty)
    @menu.select { |dish| dish[:item] == number } != []
  end

  def selection(number, qty)
    @menu.select { |dish| dish[:item] == number }
  end
  
end
