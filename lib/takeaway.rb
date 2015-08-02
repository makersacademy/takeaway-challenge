require_relative 'twilio_sender'

class Takeaway

  def initialize
    @menu = {
      pizza: 9.99,
      chicken: 2.99,
      kebab: 4.99,
      beer: 0.99,
      cider: 0.99,
      wine: 7.99
      }
      @selection = {}
  end

  def display_menu
    @menu.each do |item, price|
      "#{item.to_s.capitalize} : £#{price}"
    end
  end


#it has a menu y
#it can show a menu y
#it can choose from the menu
#it can choose more than one item off the menu
#it can choose different quantitites of items from the menu
#it can calculate the price of the menu (With one or multiple items)
#it can then send a text with the price and time for delivery

#

end
