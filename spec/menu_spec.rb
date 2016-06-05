require 'menu'

describe Menu do

	describe "#menu" do
		it "should respond to each" do
			expect(subject.menu).to respond_to(:each)
		end
	end 


	describe '#print menu' do
		it "should print the menu" do
			expect(subject.print).to eq Menu::MENU
		end 
	end 	

	describe '#price' do
		it 'shows the price of the item' do
			expect(subject.price("Burger")).to eq 5
			expect(subject.price("Steak frites")).to eq 6
		end
	end

end