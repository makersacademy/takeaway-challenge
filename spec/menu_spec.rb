require 'menu'

describe Menu do  

	subject(:menu) { described_class.new(dishes) }  

	# let(:menu) { double(:menu) }

	let(:dishes) do
		{ 
	    tucker: 3.30
		}
	end

	it "accesses dishes attribute of menu class expecting it to equal dishes hash of (dish/price, key/value) pairs" do
		expect(menu.dishes).to eq(dishes)
	end

	it "calls print on menu expecting to equal printed_menu" do
		printed_menu = "Tucker £3.30"
		expect(menu.print).to eq(printed_menu)
	end

	it "calls has_dish? on itself taking one arg (dish in question) expecting it to equal true if dish in menu hash" do 
		expect(menu.has_dish?(:tucker)).to be true
	end

	it "calls has_dish? on itself taking one arg (dish in question) expecting it to equal false if dish absent from menu hash" do 
		expect(menu.has_dish?(:shark)).to be false
	end

	it "calls price on itself with one arg (menu attribute dishes key) expecting it to equal the dishes corresponding (menu attribute dishes value) price of that hash pair" do
		expect(menu.price(:tucker)).to eq(dishes[:tucker])
	end
end
