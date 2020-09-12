require "menu"
describe Menu do
	subject(:menu) { described_class.new(dishes) }
	let(:dishes) do { "PadThai" => 7.99, "Curry" => 5.99 }
	end 
	it "is initiazlized by dishes" do
		expect(menu.dishes).to eq dishes
	end 

	it "can print out a list of the given dishes" do
		wagamama_menu = "PadThai £7.99, Curry £5.99"
		expect(menu.print). to eq(wagamama_menu)
	end

	it "can check if the dish is available" do 
		dish = "PadThai"
		expect(menu.exist?(dish)).to eq true
	end 
	it "can check if the dish does not exists" do 
		dish = "Pizza"
		expect(menu.exist?(dish)).to eq false
	end 
end 