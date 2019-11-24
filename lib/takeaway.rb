class Takeaway

  attr_reader :menu, :order_item, :order_price

  def initialize
    @menu = { "Chicken Chow Mein" => 6.50, "Egg Fried Rice" => 4.80 }
  end

  def show_menu
    puts "What would you like to eat? Please type your order"
    @menu.each { |k, v|
      p "#{k} = £#{v}\n" 
    }
  end

  def order(input = gets.chomp)
    show_menu
    @order_item = input
    @order_price = @menu[@order_item]
  end

end
