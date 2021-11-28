class Takeaway
  attr_reader :menu, :orders

  def initialize
    @menu = { rice: 3, chicken: 2, beans: 3, yam: 2, fish: 4, noodles: 2 }
    @orders = []
    @sum = 0
  end

  def add_orders(choice)
    @orders.push(choice)  
  end

  def print_menu
    @menu.each { |key,value| puts "#{key} => £#{value}" }
  end

  def print_orders
    @menu.each do |key, value|
      @orders.each do |choice|
        if choice.to_sym == key 
          puts "You ordered #{key}: £#{value}"
        end
      end
    end
  end

  def orders_total
    @orders.each { |choice| @sum += @menu[choice.to_sym].to_i }
    return "£#{@sum}"
  end 
end
