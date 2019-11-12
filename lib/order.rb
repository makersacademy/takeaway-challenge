

class Order
  attr_reader :ordered, :menus, :order_total

  def initialize
    @menus = {"Curry" => 12, "Sushi" => 4, "Edemame" => 2, "Burrata" => 6, "Salad" => 10}
    @ordered = []
    @order_total = 0
end

def display_menu
  @menus.each {|key, value|
  puts "#{key} : £#{value}"}
end

def select_item(item)
  if @menus.key?(item)
    @ordered << item
end
end

def total
  @ordered.each { |menu_item|
  @order_total += @menus[menu_item]}
  @order_total
  end
end
