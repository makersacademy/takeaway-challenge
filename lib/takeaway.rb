require './data/takeaway_menu.rb'
require './data/messages.rb'
require './lib/send_text.rb'

# things still to be done:
# still needs to move add_item, calculate_total and get_price to Order class
# error messages required for add_item, checkout and calculate_total methods
# make some methods private
# improve tests
class Takeaway

  attr_reader :menu, :messages
  attr_accessor :basket

  def initialize(menu = MENU_LIST, messages = MESSAGES_LIST)
    @menu = menu
    @messages = messages
    @basket = []
  end

  def display_menu
    menu
  end

  def add_item(name, quantity)
    quantity.times do
      basket.push(name.capitalize)
    end
    @basket
  end

  def calculate_total
    basket.map do |name|
      get_price(name)
    end.sum
  end

  def get_price(name)
    @menu[name]
  end

  def checkout(money)
    if money == calculate_total
      puts messages[:payment_success]
      send_message
    elsif money != calculate_total
      puts messages[:payment_error] + " (£#{calculate_total})"
    end
    money
  end

  def send_message(message = Message.new)
    message.send_message  
  end
end
