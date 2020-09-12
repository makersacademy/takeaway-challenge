require "menu"
describe Menu do
	it "is initiazlized by dishes" do
		expect(subject.dishes).to eq Menu::DISHES
	end 

	it "can print out a list of the given dishes" do
		menu = "PadThai £7.99, Curry £5.99, Ramen £9.99, Baked Icecream £6.99"
		expect(subject.print). to eq(menu)
	end

	it "can check if the dish is available" do 
		dish = "PadThai"
		expect(subject.exist?(dish)).to eq true
	end 
	it "can check if the dish does not exists" do 
		dish = "Pizza"
		expect(subject.exist?(dish)).to eq false
	end 

	it "shows the price of the dish" do
		expect(subject.price("PadThai")).to eq 7.99
	end 

end 