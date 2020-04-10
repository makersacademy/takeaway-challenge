class Takeaway

  attr_reader :menu, :order_item, :order_price

  def initialize
    @menu = { "Chicken Chow Mein" => 6.50, "Egg Fried Rice" => 4.80 }
  end

  def show_menu
    puts "What would you like to eat? Please type your order"
    @menu.each { |k, v|
      p "#{k} = £#{v}" 
    }
  end

  def order(input = gets.chomp, quantity = 1)
    show_menu
    @order_item = input
    raise "no such item" if !@menu[@order_item]
    @order_price = @menu[@order_item]
  end

end
