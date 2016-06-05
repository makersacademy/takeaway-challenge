require_relative 'menu'

class Order

	attr_reader :current_order

	def initialize
		@current_order = []
	end

	
	  def add(item, quantity)
    	menu = Menu.new
    	if menu.has_item?(item) then
    	@current_order << [item, quantity]
    	else  puts  "Sorry, item not available"
 		end 
      	display_order(item, quantity)
      	self
   		end
  end


  private

  def display_order(item, quantity)
  	puts "#{quantity} #{item.capitalize}s have been added to your order"
  end 




	
