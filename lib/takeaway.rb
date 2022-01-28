class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = { "Sweet & Sour Chicken Balls" => 6.30, "Salt & Pepper Chicken" => 6.30, "Chicken Fried Rice" => 6.80, "Prawn Crackers" => 2.80 }
    @order = {}
  end

  def view_menu
    @menu.each { |item, price| puts "#{item}: £#{price}" } 
  end

  def place_order(*order)
    order.each { |item| @order[item] = Float(@menu.values_at(item).join) } 
  end

  def view_order
    total = 0.0
    order.each { |item, price| total += price }
    puts "The order total is £#{total}"
    total
   end
  
end
