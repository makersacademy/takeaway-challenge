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

   private
   def deadline_set
    hour = @time.hour < 23 ? @time.hour + 1 : 0 
    minutes = @time.minute < 10 ? "0#{@time.minute}" : @time.minute    
    "#{hour}:#{minutes}"
   end

   def option_finder(option)
     @menu.choices.each do 
      |choice| return choice if choice.food == option
     end
     raise ("Not on menu")
   end

end
