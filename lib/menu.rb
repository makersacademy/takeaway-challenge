class Menu

	attr_reader :items

	def initialize
		@items = { 
			burger: 6,
			chips: 3,
			wings: 5,
			curry: 6,
			pizza: 7
		}
  end

  def view_menu
  	@items
  end

  def on_menu?(item)
  	items.key?(item)
	end	

end