require_relative './order.rb'
#interacts with the user in the ordering process

module TakeAway

  def self.show_menu
    menu_string = MenuParser.format_menu(MENU)
    Display.output(menu_string)
  end

  def self.order(total, *entries)
    order = Order.new
    entries.each do |entry|
      entry[:quantity].times{ order.add_item(MENU[entry[:item_n]-1]) }
    end
    fail PRICE_ERROR if order.total != total
  end 

  PRICE_ERROR = 'Cannot place order: total provided is incorrect' 

  MENU = [{ description: 'Roast pork',       price: 15 },
          { description: 'Steamed broccoli', price:  3 },  
          { description: 'Roasted spinach',  price:  8 },  
          { description: 'Smelly fruit',     price: 12 }].freeze
end 
