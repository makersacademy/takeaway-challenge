require_relative 'menu'
require_relative 'takeaway'
require_relative 'order'


class Menu

	attr_accessor :list

	def initialize
		@list = {}
	end

	def add_item(item, price)
		@list[item] = price
	end
end
