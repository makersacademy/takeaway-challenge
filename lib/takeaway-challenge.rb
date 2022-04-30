require_relative 'customer'

class Takeaway
  
  attr_reader :menu
  attr_reader :customer_order


  def initialize
    @menu = [{dish_name: " 1. lasagne", price: "£8.90" }, 
      {dish_name: "2. Jerk box", price: "£12.90" } , 
      {dish_name: "3. Paella", price: "£11.0" },
      {dish_name: "4. Seared Tuna rolls", price: "7.90" } ]
    @customer_order = []
    end 

  def see_menu
  puts @menu
  end

  def place_order(order_num)
    puts "Please select your order number."
    p @customer_order << @menu[order_num - 1]  
  end 
end
