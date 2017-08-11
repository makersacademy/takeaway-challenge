require 'menu'

describe Menu do
	
	it "checks if there is a list of dishes in the menu" do
		expect(subject.menu).to include({ item: 1, dish: :bruschetta, price: 4.99 })
	end

	it "prints out a list of the dishes" do
		expect{subject.print_menu}.to output("1. bruschetta : £4.99\n" +
			"2. pizza_salami : £9.99\n" +
			"3. pasta_carbonara : £12.99\n" +
			"4. sirloin_steak : £15.99\n" +
			"5. tiramisu : £5.99\n").to_stdout
	end

end
