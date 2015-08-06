module IndianMenu

	def menu 
		{"Dosa" => 4,"Badam Drink" => 3,"Bisebele Bhath" => 2,"Water" => 1}
	end

	def show
  	menu.map { |food, price| puts "#{food}: £#{price} \n" }
	end

end


module ItalianMenu

	def menu 
		{"pasta" => 4,"wine" => 3,"pizza" => 2,"Water" => 1}
	end

	def show
  	menu.map { |food, price| puts "#{food}: £#{price} \n" }
	end

end

module Menu

	def menu 
		{"water" => 4,"chips" => 3}
	end

	def show
  	menu.map { |food, price| puts "#{food}: £#{price} \n" }
	end

end



