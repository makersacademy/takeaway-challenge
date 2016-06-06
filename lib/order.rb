require_relative 'menu'
require_relative 'send_message'
require_relative 'boolean_input'

class Order

	include Boolean_input

	def initialize menu, *args
		@order = []
		@total = 0
		args.each do |array|
			array.each do |a|
				@order << "#{a[1]} x #{menu.dishes[[a[0]][0]-1][0]}"
				@total += menu.dishes[[a[0]][0]-1][1] * a[1]
			end
		end
	end

	def confirm_order
		puts "Your order is: #{get_order}"
		puts "The total price is: #{get_total}"
		send = yn("Would you like to confirm your order?" )
		if send
			Send_message.new("Your order of #{get_order} will be arriving soon")
			send
		end
		send
	end

	private

	def get_order
		if @order.length >= 2
			last = @order.pop
			string = @order.join(', ')
			string += " and #{last}"
		else
			@order[0]
		end
	end
	def get_total
		"£#{'%.2f' % @total}"
	end

end

