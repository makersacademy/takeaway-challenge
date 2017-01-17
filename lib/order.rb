require_relative 'menu'
require_relative 'messenger'

class Order
  attr_reader :calculated_amount, :items, :list, :message

  MESSAGE_BODY = "Thank you! Your order was placed and will be delivered before"

  def initialize(items)
    @items = items
    @message = Messenger.new
  end

  def calculate_total
    @calculated_amount = 0
    @list = load_menu
    items.each do |item|
    @calculated_amount += (get_item_price(item[:dish]) * item[:qty])
    end
    calculated_amount
  end

  def confirmation
    timestamp = Time.now
    delivery_time = (timestamp + 3600).strftime("%H:%M")
    @message.send_message(MESSAGE_BODY + " #{delivery_time}")
  end

  private
  def get_item_price(dish)
    @list.each do |menu_item|
      return menu_item[:price] if menu_item[:dish] == dish
    end
  end

  def load_menu
    menu = Menu.new
    menu.load_dishes
  end
end
