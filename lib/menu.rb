#Contains a list of menu with dishes and prices
class Menu

  attr_reader :raw_dish_database, :dishes

  def initialize
  	@raw_dish_database
  	@dishes
  end

  def dishes
	  @raw_dish_database = { "Dim sum"=>2, "Fried rice"=>3, "Crispy chicken"=>4, "Pepper squid"=>5 }
	end

end