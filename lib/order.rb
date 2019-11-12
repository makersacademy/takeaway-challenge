
class Order
  attr_reader :ordered, :menus, :order_total

  def initialize
    @menus = {"Curry" => 12, "Sushi" => 4, "Edemame" => 2, "Burrata" => 6, "Salad" => 10}
    @ordered = {}
    @order_total = 0
end

def display_menu
  @menus.each {|key, value|
  puts "#{key} : £#{value}"}
end

def select_item(item, quantity)
  if @menus.key?(item)
    @ordered[item]= quantity
    end
end

def place_order(totals)
  total
  fail "The total is not correct. The correct total is £#{@order_total}" if @order_total != totals
  @ordered.each do |key, value|
    puts "#{key} : #{value}"
  end
   puts "Total = £#{@order_total}"

end

def total
  @order_total = 0
  @ordered.each { |menu_item, quantity|
  quantity.times do @order_total += @menus[menu_item]
  end}
  @order_total
  end

end
