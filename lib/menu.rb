require_relative 'customer'

class Menu

attr_accessor :view_menu
attr_accessor :customer_order

	def initialize
		@view_menu = {'meat' => 7, 'fish' => 8}

	end
end