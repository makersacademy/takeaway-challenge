class Takeaway
  attr_reader :menu, :orders

  def initialize
    @menu = { rice: 3, chickhen: 2, beans: 3, yam: 2, fish: 4, noodles: 2 }
    @orders = []
    @sum = 0
  end

  def add_dishes(dish, price)
    @menu << { dish => price }    
  end

  def add_orders(choice)
    @orders.push(choice)  
  end

  def print_menu
    @menu.each { |dishes| puts dishes }
  end

  def orders_total
    @orders.each do |choice|  
       @sum += @menu[choice.to_sym].to_i 
      end
      @sum
    end 
end
