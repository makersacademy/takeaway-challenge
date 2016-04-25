require 'money'

class Order

	attr_reader :orders, :total

	def initialize
		@orders = {}
		@total = 0
	end

	def add(dish, quantity)
		p dish
		p quantity
		matches?(dish) ? @orders[dish] += quantity : @orders[dish] = quantity
		puts "#{quantity} x #{dish.name} added to your order."
	end

	def summary
		return puts "There are no dishes in your order." if empty?
		@orders.each do |dish, quantity|
			@total += (dish.money * quantity).cents
			puts "#{quantity} x #{dish.name} = #{(dish.money * quantity).format(:symbol => true)}"
		end
		puts "Order Total: #{print_total}"
	end

	private
		def empty?
			@orders.empty?
		end

		def matches?(dish)
			@orders[dish]
		end

		def print_total
			Money.new(total, "GBP").format(:symbol => true)
		end
end