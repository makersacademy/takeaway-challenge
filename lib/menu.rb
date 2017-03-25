#Contains a list of menu with dishes and prices
class Menu

  attr_reader :dish_name

  def initialize
  	@dish_name
  	@price
  end

	def options	
	  @options = {dish_name: "Dim sum", price: 2}
	end

end