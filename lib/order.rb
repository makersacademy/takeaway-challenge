require_relative 'menu'

class Order

  attr :items_ordered, :menu
  
  def initialize(menu)
    @menu = menu
    @items_ordered = []
  end

  def add_item(item)
    @items_ordered << item
  end
  
  def show_order
    print @items_ordered
  end

  def order_value
    value = 0
    @items_ordered.each { |item| value += item[item.keys.first] }
    value
  end

  def verify_order_value
    @items_ordered.each do |item|
      item.each do |k,v|
        puts "#{k}: £#{v}"
      end
    end
  end

  def order_confirmation
    verify_order_value
    puts "--------"
    puts "£#{order_value}"
  end

  def place_order
    Time.new
  end

end

items = {
  "Chicken burger" => 10,
  "Vegan Soup" => 5,
  "Chang Beer" => 3,
}

item = {
  "Chicken burger" => 10
}
item2 = {
  "Vegan Soup" => 5,
}

menu = Menu.new(items)
my_order = Order.new(menu)
# my_order.show_menu(menu)
my_order.add_item(item)
my_order.add_item(item2)
# my_order.show_order
my_order.order_value
my_order.order_confirmation
my_order.place_order




