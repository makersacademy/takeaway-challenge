require_relative 'menu'
require_relative 'messenger'

class TakeAway
  attr_reader :order, :total_cost

  def initialize(menu_class = Menu.new, messenger_class = Messenger.new)
    @menu = menu_class
    @messenger = messenger_class
    @order = []
    @total_cost = 0
  end

  def display_menu
    menu.show
  end

  def choose_item(item, quantity)
    raise 'Cannot choose this item!' unless on_menu? item
    order << { 'item' => item, 'quantity' => quantity, 'price' => get_price(item) }
  end

  def view_order
    raise 'Please select an item first' if order.empty?
    order.each do |item|
      puts "#{item['item']}: #{item['quantity']} @ £%0.2f" % item['price']
    end
    update_total
  end

  def place_order
    message = "Thank you for your order. The total is £%0.2f and will be with you within the hour!" % total_cost
    send_confirmation(message)
  end

  private

  attr_reader :menu

  def on_menu?(item)
    menu.items.include? item
  end

  def get_price(item)
    menu.items[item]
  end

  def update_total
    @total_cost = order.reduce(0) { |sum, item| sum + item['quantity'] * item['price'] }
    puts "Grand total: £%0.2f" % @total_cost
  end

  def send_confirmation(message)
    @messenger.send(message)
  end
end
