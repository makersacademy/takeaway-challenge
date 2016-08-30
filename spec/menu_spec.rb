require 'menu'

describe Menu do


	describe "#menu" do
		it "should respond to each" do
			expect(subject.menu).to respond_to(:each)
		end
	end 


	describe '#print menu' do
		it "should print the menu" do
			expect(subject.print_menu).to eq Menu::MENU
		end 
	end 	

	describe '#price' do
		it 'shows the price of the item' do
			expect(subject.price("Salad")).to eq 4
			expect(subject.price("Burger")).to eq 5
			expect(subject.price("Chips")).to eq 3
			expect(subject.price("Soda")).to eq 1
		end
	end

	describe "#has_item?" do
		it "checks if the item is on the menu and raises error if it isn't" do
			message = "Sushi is not available!"
			expect {subject.has_item?('sushi')}.to raise_error message
		end 
	end

end