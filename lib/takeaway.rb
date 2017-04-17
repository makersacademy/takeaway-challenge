class Takeaway
	attr_reader :t_price

	
	MENU =  { :Pizza => 15, 
              :Soup  => 10, 
              :Beef_steak => 25,
              :Omlet => 8, 
              :Rice => 3, 
              :Ice_cream=> 4, 
              :Cofe => 4, 
              :Tea  => 3, 
              :Juice => 11 }

	def list
		puts "The menu"
		MENU.each {|key, value| puts "#{key} with price £ #{value}" }
	end

	def order(key_number)
		list_ord[MENU.keys[key_number-1]] += 1
	end

	def list_ord
		@list_ord ||= Hash.new(0)
	end

	def order_u 
		list_ord.sort_by { |key, value| value }
		print_order
		print_t_price
	end

	def print_order
		puts "Your order"
		list_ord.each do |key, value|
			puts "#{key}, #{value}"
		end
	end

	def t_price
		t_price = 0
		list_ord.each do |key, value|
			t_price += (MENU[key] * value)
		end
		t_price
	end

	def pt_price
		puts "Total: #{t_price}"
	end
end