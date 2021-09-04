
class Menu
    
  MENU = {:dish => 'Chicken burger', :price => 10},
    {:dish => 'Beef burger', :price => 12},
    {:dish => 'Fish dog', :price => 11},
    {:dish => 'Hallumi fritter burger', :price => 8},
    {:dish => 'Sloppy Joe dog', :price => 9},
    {:dish => 'Truffle fries', :price => 4},
    {:dish => 'Mac & Cheese', :price => 5},
    {:dish => 'Corn ribs', :price => 4}
  
  attr_reader :menu

  def initialize
    @menu = MENU
  end  
    
end