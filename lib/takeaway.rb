require "Pry"


 class Takeaway

  attr_reader :text, :menu, :order  

  def initialize
      @menu = Menu.new 
      @order = Order.new 
  end 
 
   def greeter 
   puts "1. See menu"
   puts "2. Enter order by item number, separating items by ',' "
   puts "3. Calculate total"
   puts "4. Check total of order"
   puts "5. Exit"
   end 

  def welcome
      loop do
          greeter
          my_choice = gets.chomp.to_i
        
   if my_choice == 1
     @menu.list 
   elsif my_choice == 2
     @order.take_order(order)
   elsif my_choice == 3
     @order.order_total
   elsif my_choice == 4
     @order.check_total
   elsif my_choice == 5
      return
   else
     puts "I don't know what you meant, try again"
   end
   end 
  end 

 
  def text 
   puts "Thank you! Your order was placed and will be delivered before 18:52"
  end 

end 

class Order 

   attr_reader :take_order, :order_total, :check_total, :order, :full_order, :cost 

   def initialize
       @full_order = full_order
       @order = order 
       @cost = cost 
       @prices = [1,3,4,2,7]
   end 

   def take_order(order) 
    order = gets.chomp
    @full_order = order.split(",")
    # ["1", "2"]
    @full_order = @full_order.map {|x| x.to_i }
    #[1,2]
  
    end 

  

   def order_total
      # @cost = @full_order.inject(0, :+)
    full_order.select {|key, value| puts "#{v}" if k == @full_order(0) }
    # Use array to select from @our_menu 
      end
  

      p @cost 
      return
       

    end 



   def check_total  
       text
   end 

end 

class Menu

   attr_reader :our_menu, :list

   def initialize
    @our_menu = [{"Pizza" => 3}, {"Burger" => 4 }, {"Orange Juice" => 2}, {"Wine" => 7}]
   end


    def list
    @our_menu.each_with_index do |hash, index|
     hash.each do |k,v|
       puts "#{index+1}. #{k} #{v}£"
     end
    end
   end


end


ruby= Takeaway.new
ruby.welcome

# ruby_food = Menu.new
# ruby_food.list

binding.pry