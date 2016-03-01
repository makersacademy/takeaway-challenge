require_relative 'menu.rb'

class Select

	attr_reader :menu, :due

	def initialize
		@menu 	= Menu.new
		@menu 	= @menu.menu
		@order 	= {}
		@total 	= []
		@due 	= 0
	end

	def see
		@menu
	end
    
    def pick(dish , quantity=1)
    	string_support(dish)
    	fail 'this dish is not in the menu' unless @menu.include? dish
    	set_order_total(dish , quantity)
    end
    
    def order
    	orden1
    end


    def bill
    	calculadora
    	bill1
    	"Due #{@due}£"
    end

    def place_order
    	bill
    	deliver
    end


private

	def set_order_total(dish , quantity)
		@order.merge!({"#{quantity} #{dish}"=>{"#{@menu[dish]}£ each"=>"#{quantity*@menu[dish]}£"}})
    	@total << [quantity,menu[dish]]
    	puts 'would you like something else?'
	end

	def string_support(dish)
		dish.downcase!
    	dish.capitalize!
    end

    def calculadora
    	@due=0
    	@total.each do |x|
    		@due+= x[0] * x[1]
    	end
    end

    def orden1
    	@order.each do |key, value|
    		value.each do |k,v|
    			puts "#{key}-> #{k} -> #{v}"
    		end
    	end
    end
    def bill1
    	@order.each do |key, value|
    		value.each do |k,v|
    			puts "#{key}-> #{k} -> #{v}"
    		end
    	end
    end

    def deliver
    	t = Time.now + 1132
    	"Thank you! Your order will be delivered before #{t.strftime('%H:%M')}"
    end
end
