class Menu
  
  attr_reader :list_of_dishes
  
  def initialize
  	@list_of_dishes = { "lasagne" => 8, 
  		                "pizza" => 14, 
  		                "classic burger" => 11,
  		                "cheese burgeer" => 12,
  		                "beef burger" => 13,
  		                "salad" => 4 }
  end

  def list
  	@list_of_dishes.each { |name,price| puts "#{name}....€#{price}." }
  end

  def dish_name
  	list_of_dishes.map { |key, value| key }
  end

end