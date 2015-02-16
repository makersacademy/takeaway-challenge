class Customer
	attr_reader :telephone_number

	def telephone_number(input)
		if input[0] == "0"
			input[0] =''
			input.insert(0,"+44")
		end
	end	
end