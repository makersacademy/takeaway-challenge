require_relative 'send_text'
require_relative 'menu'

class Order

  attr :items_ordered
  
  def initialize
    @items_ordered = []
  end

  def add_item(menu, order)
    @items_ordered << menu.items[order - 1]
  end

  def items
    puts "Items ordered"
    puts "-------------"
    @items_ordered.each { |item| puts "#{item.keys.first}: £#{item[item.keys.first]}" }
  end

  def value
    items_ordered
    value = 0
    @items_ordered.each { |item| value += item[item.keys.first] }
    puts "--------------"
    puts "Total: £#{value}"
  end

  def place_order(send_text = SendText.new)
    send_text.tester
  end

end

items = [{ "Chicken burger" => 10 }, { "Vegan Soup" => 5 }, { "Chang Beer" => 3 }]

menu = Menu.new(items)
print menu.show_menu
order = Order.new
order.add_item(menu, 2)
order.add_item(menu, 1)
order.items
order.value
order.place_order
