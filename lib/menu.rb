require_relative 'rice'
require_relative 'chicken'
require_relative 'lamb'
require_relative 'mutton'
require_relative 'naan'
require_relative 'poppadom'
# require_relative 'message'

class Menu

	attr_reader :items, :order, :total

	def initialize
		@items = []
		@order = []
		@total = []
		items << Rice.new
		items << Chicken.new
		items << Lamb.new
		items << Mutton.new
		items << Naan.new
		items << Poppadom.new
	end

	def display_menu
		puts 'Rice           £2.35'
		puts 'Chicken curry  £6.25'
		puts 'Lamb curry     £7.49'
		puts 'Mutton curry   £6.59'
		puts 'Naan bread     £1.29'
		puts 'Poppadom       £0.75'
	end

	def select(item)
		if item == Rice
			total << 2.35
		elsif item == Chicken
			total << 6.25
		elsif item == Lamb
			total << 7.49
		elsif item == Mutton
			total << 6.59
		elsif item == Naan
			total << 1.29
		else
			total << 0.75
		end
		item = item.new
		order << item
	end

	def bill
		puts '£' + (total.inject{|sum,x| sum + x }).to_s
	end

	def checkout
		text
	end

end