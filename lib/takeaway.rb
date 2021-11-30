class Takeaway
  attr_accessor :menu, :food, :price, :view_menu
    
  def initialize
    @menu = Hash.new
  end

  def add_food(food, price)
    @menu[food] = price
  end
  #use this to add food to takeaway menu

  def view_menu
    @menu
  end
  #use this to view takeaway menu
end
