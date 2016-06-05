require_relative 'menu'

class Takeaway

	attr_reader :selection

	def initialize
		@selection = {}
	end

	def read_menu
		menu = Menu.new
		menu.display_menu
	end

	def order
		selection
	end

end