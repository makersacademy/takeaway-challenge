require  "./lib/menu"
require "date"

class Order 
   
  def initialize(time: time = DateTime.now, menu: menu = Menu.new )
  @time = time
  @menu = menu
  @list = []
  end

  def request(order)
    "Thank you! Your order will be delivered at #{deadline_set}"
  end

  def list
    @list.dup
  end
  
  def add(option)
    choice = option_finder(option)
    @list << choice
  end


   private
   def deadline_set
    hour = @time.hour < 23 ? @time.hour + 1 : 0 
    minutes = @time.minute < 10 ? "0#{@time.minute}" : @time.minute    
    "#{hour}:#{minutes}"
   end

   def option_finder(option)
     @menu.choices.each {|choice| return choice if choice.food == option}
   end

end
