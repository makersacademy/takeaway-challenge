class Menu
  attr_reader :menu_items
  
  def initialize 
    @menu_items = { 
      kungpochicken: 6.80,
      chickenchowmein: 6.30,
    }
  end
end