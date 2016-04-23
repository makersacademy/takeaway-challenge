class Menu

	def initialize(entry)
		@list = reformat(entry)
	end

	def reformat(entry)
		list = {}
		entry.each do |item,price|
			list[item]={price:price}
		end
		list
	end

	def list=(new_list)
		@list = reformat(new_list)
	end

	def list
		@list.dup
	end

end