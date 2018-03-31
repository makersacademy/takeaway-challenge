class Takeaway

	MENU = {
		:Pie => 5.99,
		:Sandwich => 3.29,
		:Falafel => 1.00,
		:Bagel => 2.56,
		:Wrap => 4.49,
	}

	def show_menu
		MENU.each do |dish, price|
			puts "#{MENU.keys.index(dish)+1}." + "#{dish.to_s.split.join(" ")}".ljust(25) + "£#{'%.2f' % price}".rjust(8)
		end
	end

end