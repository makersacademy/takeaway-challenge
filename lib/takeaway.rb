#interacts with the user in the ordering process
module TakeAway

  def self.show_menu
    menu_string = MenuParser.format_menu(MENU)
    Display.output(menu_string)
  end

  def self.order(total, *dishes)
  end 


  MENU = [{ description: 'Roast pork',       price: 15 },
          { description: 'Steamed broccoli', price:  3 },  
          { description: 'Roasted spinach',  price:  8 },  
          { description: 'Smelly fruit',     price: 12 }].freeze
end 
