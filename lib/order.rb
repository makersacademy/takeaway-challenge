require  "./lib/menu"
require "date"

class Order 
   
  def initialize(time = DateTime.now, menu = Menu.new )
  @time = time
  @menu = menu
  @list = []
  end
  
  def add(option, quantity = 1)
    choice = option_finder(option)
    quantity.times { @list << choice } 
  end

  def total
    @list.reduce(0) { |total, choice| total += choice.price} 
  end

  def list
    @list.dup
  end

  def submit(amount)
    check_total(amount)
    "Thank you! Your order will be delivered at #{deadline_set}"
  end

  

  private
   def deadline_set
    hour = @time.hour < 23 ? @time.hour + 1 : 0 
    hour = time_format(hour)
    minutes = time_format(@time.minute)   
    "#{hour}:#{minutes}"
   end

   def time_format(time)
      time = time.to_s
      time.length == 1  ?  "0" + time : time   
   end

   def option_finder(option)
     @menu.choices.each do 
      |choice| return choice if choice.food == option
     end
     raise ("Not on menu")
   end

   def check_total(amount)
   message = "Order failed, you paid £#{amount}, your order cost £#{total}. Try again"
   raise message if amount != total
   end
end
