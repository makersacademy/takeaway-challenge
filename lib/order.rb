require_relative 'send_text'
require_relative 'menu'

class Order

  attr :items_ordered
  
  def initialize
    @items_ordered = []
  end

  def add_item(menu, order)
    @items_ordered << menu.items[order]
  end
  
  def order_value
    value = 0
    @items_ordered.each { |item| value += item[item.keys.first] }
    value
  end

  def items_ordered
    @items_ordered.each do |item|
      item.each do |k,v|
        puts "#{k}: £#{v}"
      end
    end
  end

  def confirmation
    items_ordered
    puts "--------"
    puts "£#{order_value}"
  end

  def place_order(send_text = SendText)
    send_text.new.tester
  end

end

items = [{"Chicken burger" => 10}, {"Vegan Soup" => 5}, { "Chang Beer" => 3}]

menu = Menu.new(items)
# menu.show_menu
order = Order.new
order.add_item(menu, 2)
order.add_item(menu, 1)
order.order_value
order.confirmation
order.place_order
puts ENV['ACCOUNT_SID']
puts ENV['AUTH_TOKEN']
puts ENV['MOB_NUMBER']






