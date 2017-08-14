require 'menu'

describe Menu do
	
	 it "checks if there is a list of dishes in the menu" do
 		 expect(subject.menu).to include({ dish: :bruschetta, quantity: 1, price: 5 })
 	end

	 it "prints out a list of the dishes" do
 		 expect { subject.print_menu }.to output("1. bruschetta : £5\n" +
  			"2. pizza_salami : £10\n" +
  			"3. pasta_carbonara : £13\n" +
  			"4. sirloin_steak : £16\n" +
  			"5. tiramisu : £6\n").to_stdout
 	end

end
