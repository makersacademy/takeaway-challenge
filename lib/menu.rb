class Menu

  attr_reader :menu

  def initialize
    # Dish.new('pizza', 10.50), Dish.new('curry', 8.00), Dish.new('burger', 6.50)
    # @menu = create_menu
    @menu = [
      { dish: 'pizza', price: 10.50 },
      { dish: 'curry', price: 8.00 },
      { dish: 'burger', price: 6.50 }
    ] # I think, in reality, the menu would be loaded from a server
  end

  def display
    puts "\nWelcome to Takeaway\n"
    puts "\n" + left("item") + left("Dish") + "Price".center(10)
    @menu.each.with_index do |item, i|
      puts left((i + 1).to_s + ".") + left(item[:dish]) + currency(item[:price]).center(10)
    end
    puts "\nPlease .select_dish (item number) and quantity\n"
  end
# @display.push([i, item[:name], item[:price]]
  # def create_menu
  #   @menu = [
  #     Dish.new('pizza', 10.50),
  #     Dish.new('curry', 8.00),
  #     Dish.new('burger', 6.50)
  #   ]
  # end

  private
  def currency money
    '£%.2f' % money
  end

  def left string
    '%-10s' % string
  end

end
