class Takeaway

	attr_reader :menu, :order, :actualcost

	def initialize
		@menu = {"Cheeseburger" => 1,
			"Pizza" => 2,
			"Fries" => 3
		}
		@actualcost = 0
	end

	def takeorder hash, totalprice
		items_on_menu(hash)
		calccost(hash)
		customer_price_check(totalprice)
		@order = hash
	end


	def items_on_menu hash
		hash.keys.each do |item|
			if @menu.keys.include?(item) == false
				fail "I'm sorry, your order is not on the menu."
			end
		end
	end

	def calccost hash
		hash.keys.each do |item|
			@actualcost += @menu[item] * hash[item]
		end
	end

	def customer_price_check totalprice
		fail 'You have added the wrong price' if totalprice != @actualcost
	end
end