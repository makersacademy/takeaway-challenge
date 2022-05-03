class Takeaway
  
  attr_reader :menu 
  attr_reader :customer_order


  def initialize
    @menu = [{dish_name: "1. lasagne", price: 8.90 }, 
      {dish_name: "2. Jerk box", price: 12.90 } , 
      {dish_name: "3. Paella", price: 11.00 },
      {dish_name: "4. Seared Tuna rolls", price: 7.90 } ]
    @customer_order = []
    @total_bill = 0
  end 

  def see_menu
  puts @menu
  end

  def place_order(order_num)
    puts "Please select your order number."
    index = order_num - 1
    order = @menu[index] 
    @customer_order << order
    p @customer_order
  end 

  def bill
    @customer_order.each do | item_ordered |
    @total_bill += item_ordered[:price]
    return @total_bill
    end
  end 
end
