class Takeaway

def initialize
  @menu = {
    "King Prawn Noodles" => 5.80,
    "Chicken Fried Rice" => 3.90,
    "Beef Fried Rice" => 3.90,
    "Duck Fried Rice" => 5.60
  }
  @basket = []
end

  def print_menu
    @menu.each{|k,v| puts "#{k} - £#{v}0"}
  end

  def place_an_order(dish, qnty)
    @basket << {dish => qnty}

  end

  def basket
    message = "Items in your basket:"
    "#{message} #{@basket.each{|x| x.each{|k,v| puts "#{k} - #{v} pcs"}}}"
  end
end
