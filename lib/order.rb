class Order

   attr_reader :current_order, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @current_order = []
    @total = 0
  end

  def add()
    loop do
      puts "what would you like?", "hit 'n' to quit"
      if (input = gets.chomp) != "n"
        order = nil
        @current_order << (order = @menu.menu.select { |x| x == input})
        @total += order.values.sum
      else
        break
      end
    end
  end

  def receipt
    @current_order.each { |item|
      puts "#{item.keys.join()} -   £   #{item.values.join().to_f}"
    }
    puts "---------"
    puts "Grand Total: £#{@total}"
    @total
  end




end