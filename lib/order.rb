# deals with orders + cost

class Order

	def initialize(menu:) #dependency injection - 'other class is injected into this class'
		@menu = menu
	end

	def print_menu
		menu.print
	end

	private

	attr_reader :menu  ## ?? ## why is this private?

	# def select
		
	# end

	# def total

	# end

	# def text

	# end
end