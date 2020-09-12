require "menu"
describe Menu do
	subject(:menu) { described_class.new(dishes) }
	let(:dishes) do { PadThai: 7.99, Curry: 5.99 }
	end 
	it "is initiazlized by dishes" do
		expect(menu.dishes).to eq dishes
	end 

	it "can print out a list of the given dishes" do
		wagamama_menu = "PadThai £7.99, Curry £5.99"
		expect(menu.print). to eq(wagamama_menu)
	end
end 