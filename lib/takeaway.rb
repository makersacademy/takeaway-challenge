require './data/takeaway_menu.rb'
require './data/messages.rb'

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
    elsif money != calculate_total
      puts messages[:payment_error]
      puts "(£#{calculate_total})"
    end
    money
  end
end