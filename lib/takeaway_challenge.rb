

class TakeAway

  MENU = { "spring roll" => 0.99, 
  	       "char sui bun" => 3.99, 
  	       "pork dumpling" => 2.99, 
  	       "peking duck" => 7.99, 
  	       "fu-king fried rice" => 5.99 }

  COUNT = 1
  PRODUCT_ERROR = "Item does not exist"
  CHECKOUT_MESSAGE = "Thanks for ordering at #{Time.now}. Your order will be with you in 1 hour."

  
  attr_accessor :order_array, :menu, :checkout_message

  def initialize(menu = MENU, order_array = [])
    @menu = menu.each { |item, price| "#{item}: #{price}" }
    @order_array = order_array 
    @total = []
    
  end

  def read_menu
    @menu
  end
  
  def order(item, count = COUNT) #price = @menu[price])
    fail PRODUCT_ERROR if @menu[item].nil?
    @order_array.push("#{item} x#{count}")
  	 #@total.push(@menu[price])
  	 if count.nil? 
      "1x #{item}(s) added to your basket."
      else
        "#{count}x #{item}(s) added to your basket."
     end
  end

  def basket_summary
  	 @order_array.each { |item, count| "#{item} x#{count}" } 
  end

  def total_amount
  	 @total.join(" ")
  	
  end         
   
  def checkout(checkout_message = CHECKOUT_MESSAGE)
  	@checkout_message = checkout_message
    p @checkout_message
 end

end
