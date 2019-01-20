class Menu
  attr_reader :menu
  def initialize(menu = {:pizza => 3, :chips => 6, :curry => 7, :cake => 6})
    @menu = menu
  end
  
  def display
    @menu
  end
  
  def has_dish?(dish)
    @menu.has_key?(dish.to_sym)
  end
end
