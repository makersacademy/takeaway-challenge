require_relative 'menu'


class Order
  attr_reader :order, :final_total, :place_order_total
  def initialize 
    @order = []
    @final_total
    @place_order_total
  end 
  
  def open_menu(menu)
    @menu = menu.menu_hash
    look_at_menu
  end 

  def look_at_menu # menu object 
     @menu.each do |k,v|
      v = sprintf '%.2f' % v
      puts  "#{k}: £#{v}"
    end 
  end

  def choose(food_input,amount_input)
    food_input = food_input.to_sym # assuming user enters a string
    @menu.each do |food, money|
      if food_input == food
        @order << {food: food_input, price: money*amount_input, amount: amount_input}
      end 
      total 
    end 
  end



  def place_order
    print_place_order
    @place_order_total = total
  end 
  
  def print_place_order
    order.each do |hash|
      puts "food: #{hash[:food]}, amount: #{hash[:amount]}, price: £#{hash[:price]}"
    end 
    puts "£#{total}"
  end 

  def total#(order)
    total = 0
    #@order[0][:price] + @order[1][:price]
    order.each do |hash|
      total += hash[:price]
    end 
    @final_total = total
  end 

  def verify 
    if @place_order_total != @final_total
      raise "total does not equal prints_order" 
    else 
      send_sms 
    end
  end 

  def send_sms
    #require_relative 'send_sms'
    puts "send text"
  end 

  
end 