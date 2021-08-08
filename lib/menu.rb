class Menu
  
  def initialize
  
    @menu = [{ :item => "Chicken Karahi", :price => 16 },
      { :item => "Lamb Karahi", :price => 20 },
      { :item => "Seekh Kebab", :price => 5 },
      { :item => "Naan", :price => 1 },
      ]
  end
  
  def display_menu
  
    @menu
    
  end
  
end
