require_relative "menu"
require_relative "text_message"

class Takeaway

  attr_reader :basket, :menu

  def initialize
    @basket = {}
    @menu = Menu.new.menu
    #@total = 0
    #@message = TextMessage.new
  end

  def show_menu
    menu.each do |item, key|
      print item.ljust(20)
      puts "£#{key}".rjust(20)
    end
  end

  def order(item, quantity = 1)
    item = item.capitalize
    fail item_error unless check_menu(item)
    @basket.store(item, quantity)
    confirm(item, quantity)
  end

  def total
    total = 0
    basket.each do |key, value|
      total += (value * menu[key])
    end
    total
  end

  def place_order(message = TextMessage.new)
    message.send_message(confirmation)
  end


  private

  def check_menu(item)
    @menu.key?(item)
  end

  def confirm(item, quantity)
    "#{quantity} #{item} has been added to your basket"
  end

  def delivery_time
    (Time.now + (60 * 60)).strftime("%H:%M")
  end

  def confirmation
    "Thank you, your order will be delivered by #{delivery_time}"
  end

  def item_error
    "Sorry, that item is not on the menu"
  end

end
