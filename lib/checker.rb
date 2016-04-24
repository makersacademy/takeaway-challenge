class Checker

	def check_items(order,menu)
		order.keys.each do |order_item|
			unless menu.keys.include?(order_item)
				raise "Sorry, #{order_item} is not on the menu. Please re-order. (View the menu using .view_menu)"
			end
		end
	end

	def check_price(total,order,menu)
		price = calculate_price(order,menu)
		if total > price
			raise "Sorry, the total price is £#{price}. You have paid £#{total-price} too much! Please try again."
		elsif total < price
			raise "Sorry, the total price is £#{price}. You need to pay £#{price-total} more! Please try again."
		end
	end

	def pass?(total,order,menu)
		check_items(order,menu)
		check_price(total,order,menu)
		true
	end

	private

	def calculate_price(order,menu)
		price = 0
		order.each do |item,quant|
			price += (menu[item][:price] * quant)
		end
		price
	end

end