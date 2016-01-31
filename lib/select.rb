require_relative 'menu.rb'

class Select

	attr_reader :order, :menu, :due

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
    	raise 'this dish is not in the menu' unless @menu.include? dish
    	set_order_total(dish , quantity)
    end

    def bill
    	calculadora
    	"#{@order} +'\n' + Due #{@due}£"
    end

    def place_order
    	bill
    	deliver
    end


private

	def set_order_total(dish , quantity)
		@order.merge!({"#{quantity} #{dish}" => {"#{@menu[dish]}£ each"=> "#{quantity * @menu[dish]}£"}})
    	@total <<([quantity,menu[dish]])
	end

	def string_support(dish)
		dish.downcase!
    	dish.capitalize!
    end

    def calculadora
    	@due=0
    	@total.each do |x|
    		@due = @due + x[0] * x[1]
    	end
    end

    def deliver
    	t = Time.now + 1132
    	"Thank you! Your order has been placed and will be delivered before #{t.strftime('%H:%M')}"
    end
end
