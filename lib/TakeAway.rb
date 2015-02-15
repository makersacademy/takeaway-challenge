require "twilio-ruby"

class Takeaway

	attr_reader :menu

	def initialize
		@menu = {
			"brain pizza" 	=> 5,
			"lungs burger"	=> 10,
			"eye chips"			=> 3,
			"diet blood"		=> 2}
		@order = {}
	end

	def show_menu
		menu.each do |item, price|
			print "this is your zombie menu"
			print "#{item}..............#{price}"
		end
	end

	def order_food
		show_menu
		puts 'Hello welcome to the Zombie restaurant, what would you like today?'
		dish = gets.chomp
		# puts "how many would you like?"
		# quantity = gets.chomp.to_i
		order[dish]
	end

	def take_call
		puts "Hello welcome to the zombie restaurant how can I help you?"
		

	end

end

