class Menu
attr_reader :order, :total 
  def initialize(menu)
    @menu = menu
    @order = []
    
  end

  def look_at_menu
    @menu.each do |k,v|
      v = sprintf '%.2f' % v
      puts  "#{k}: £#{v}"
    end 
  end

  def choose(food_input,amount_input)
    food_input = food_input.to_sym
    @menu.each do |food, money|
      if food_input == food
        @order << {food: food_input, price: money*amount_input, amount: amount_input}
      end 
    end 
  end

  def total
    total = 0
    #@order[0][:price] + @order[1][:price]
    @order.each do |hash|
      total += hash[:price]
    end 
    @total = total
  end 

  def prints_order
    @order.each do |hash|
      puts "food: #{hash[:food]}, amount: #{hash[:amount]}, price: £#{hash[:price]}"
    end 
    puts "£#{@total}"
  end 
    

end 
    

