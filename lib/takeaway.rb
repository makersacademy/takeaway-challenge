class Takeaway

  MENU = {
    "ramen" => 8,
    "sushi" => 10,
    "sashimi" => 14,
    "bento" => 18
  }

  attr_reader :order, :bill

  def initialize(menu = MENU)
    @menu = menu
    @order = []
    @bill = 0
  end

  def display_menu
    @menu.each do |key, value|
      puts "#{key}: £#{value}"
    end
  end

  def add_dish(item, quantity = 1)
    quantity.times {  @order << item }
  end

  def total
    @order.each do |item|
      @bill += @menu[item]
    end
    "Your order of #{order.count} items comes to a total of £#{@bill}"
  end
end
