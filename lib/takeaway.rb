require_relative "menu"
require_relative "text_message"

class Takeaway

  attr_reader :basket, :menu, :total

  def initialize
    @basket = {}
    @menu = Menu.new.menu
    @total = 0
    #@message = TextMessage.new
  end

  def print_menu
    @menu
  end

  def order(item, quantity = 1)
    item = item.capitalize
    fail "Sorry, that item is not on the menu" unless check_menu(item)
    @basket.store(item, quantity)
    confirm(item, quantity)
  end

  def total
    @menu.each do |key, value|
      if @basket.has_key?(key)
        @total += (@basket[key] * value)
      end
    end
    @total
  end

  def place_order(message = TextMessage.new)
    message.send_message(confirmation)
  end


  private

  def check_menu(item)
    @menu.has_key?(item)
  end

  def confirm(item, quantity)
    "#{quantity} #{item} has been added to your basket"
  end

  def delivery_time
    (Time.now + (60 * 60)).strftime("%H:%M")
  end

  def confirmation
    "Thank you, your order has been placed and will be delivered by #{delivery_time}"
  end


end
