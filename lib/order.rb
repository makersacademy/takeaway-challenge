require  "./lib/menu"
require "date"
require "messenger"

class Order 
   
  def initialize(messenger = Messenger.new, time = DateTime.now, menu = Menu.new)
  @time = time
  @menu = menu
  @list = []
  @messenger = messenger
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
    raise "Order failed, nothing in basket" if empty_basket?
    check_total(amount)
    @messenger.confirmation
  end
  
  private
 

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

   def empty_basket?
     list.empty?
   end 
end
