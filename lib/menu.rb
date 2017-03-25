#Contains a list of menu with dishes and prices
class Menu

  attr_reader :raw_dish_database, :dishes

  def initialize
  	@raw_dish_database
  	@dishes
  end

  def dishes
	  @raw_dish_database = { dim_sum: 2, 
  	    fried_rice: 3,
  	    crispy_chicken: 4,
  	    pepper_squid: 5 }
	end

end