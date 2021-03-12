class Order

  attr_reader :order_list, :order_total

  def initialize
    @order_list = Array.new
    @order_total = 0
  end

  def add_to_order(menu)
    loop do
      @order_list << order_entry(menu)
      puts "Is your order complete?"
      if $stdin.gets.chomp.downcase == "y"
        return @order_list
      end
    end
  end

  def order_entry(menu)
    loop do 
      puts "Please enter the dish number or name to add to order:"
      dish = input_check($stdin.gets.chomp)
      puts "You have chosen #{dish} is this correct?"
      if $stdin.gets.chomp.downcase == "y"
        return menu.search_menu_items(dish)
      end
    end
  end

  def input_check(input)
    input =~ /\d/ ? input.to_i : input.downcase.capitalize
  end
end
