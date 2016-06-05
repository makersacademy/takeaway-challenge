require_relative './order.rb'
require_relative './menu_parser.rb'
require_relative './display.rb'

#interacts with the user in the ordering process

module TakeAway

  def self.show_menu
    menu_string = MenuParser.format_menu(MENU)
    Display.output(menu_string)
  end

  def self.order(total, telephone, *entries)
    order = Order.new

    entries.each do |entry|
      entry[:quantity].times{ order.add_item(MENU[entry[:item_n]]) }
    end

    input_total_is_correct = order.total == total

    if input_total_is_correct
      latest_delivery = (Time.now + 60*60).strftime('%R')
      text_msg = "Thank you! Your order was placed and 
                  will be delivered before #{latest_delivery}".freeze
      SmsInterface.new.send_text(telephone, text_msg)
      #this dependency should be injected, although this makes the parameters
      # tricky: I think the splat would need removing
    else
      fail PRICE_ERROR 
    end 
  end 


  PRICE_ERROR = 'Cannot place order: total provided is incorrect'.freeze

  MENU = [{ description: 'Roast pork',       price: 15 },
          { description: 'Steamed broccoli', price:  3 },  
          { description: 'Roasted spinach',  price:  8 },  
          { description: 'Smelly fruit',     price: 12 }].freeze
end 
