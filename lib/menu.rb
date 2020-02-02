
class Menu
  attr_reader :menu_list

  def initialize
    @menu_list = {
      "pizza" => 10,
      "curry" => 9,
      "falafel" => 3.50,
      "padthai" => 7 }
  end 

  def view
    @menu_list
  end 

  def price(dish)
    menu_list[dish]
  end 
end 


 