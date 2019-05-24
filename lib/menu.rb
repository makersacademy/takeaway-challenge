class Menu
  attr_accessor :menu_dishes
  def initialize
    @menu_dishes = { :pizza => 4.00, :sausage => 2.00, :curry => 6.50, :rice => 2.00, :chilli => 6.00, :salad => 3.50 }
    #  The above @menu_disheshash should come from the Menu class. Need to figure out how to access it
  end

  def list_menu
    return @menu_dishes
  end

end