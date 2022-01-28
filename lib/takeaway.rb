class Takeaway

  attr_reader :menu

  def initialize
    @menu = { "Sweet & Sour Chicken Balls" => 6.30, "Salt & Pepper Chicken" => 6.30, "Chicken Fried Rice" => 6.80, "Prawn Crackers" => 2.80 }
  end

  def view_menu
    @menu.each { |item, price| puts "#{item}: £#{price}" } 
  end

  def place_order(order)
  order 
  end

end
