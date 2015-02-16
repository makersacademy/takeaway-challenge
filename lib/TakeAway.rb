require 'twilio.rb'

class Takeaway

include Sms

	attr_reader :menu, :order

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
		p show_menu
		puts 'Hello welcome to the Zombie restaurant, what would you like today?'
		dish = gets.chomp
		puts 'how many of there would you like?'
		quantity = gets.chomp.to_i
		order[quantity, dish] = menu[dish]
		say_order
	end

	def say_order
		say_order = 0
    say_order.each do |item, price|
      puts "That would be a  #{item[0]}, with a value of $#{price}."
    end
	end
		

end

