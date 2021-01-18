require_relative 'takeaway'

class Order

  attr_reader :selected_dishes

  def initialize 
    @selected_dishes = []
    @total = []
  end 

  def add_dish(dish)
    @selected_dishes << dish
  end 

  def total
    @selected_dishes.each { |item| @total << Takeaway.new.menu[item] } 
    @total.sum
  end 

  def place_order
    puts "Your order details are below:"
    @selected_dishes.each {|item| puts item }
    puts "Your total is #{total}."
    # require_relative 'send_sms'
  end 

end 



  # def show_order
  #   @checkout = []
  #   @selected_dishes.each { |item|
  #   if @selected_dishes.count(item) > 1
  #     @checkout << "#{item} x #{@selected_dishes.count(item)}"
  #   else
  #     @checkout << "#{item} x 1"
  #   end 
  # }
  #   @final_checkout = 
  #   puts "Here is your order summary:"
  #   puts @checkout 
  #   puts "Total = #{total}"
  # end 
