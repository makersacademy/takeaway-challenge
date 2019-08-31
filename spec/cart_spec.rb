require './lib/cart'

describe Cart do
	let(:cart) { Cart.new }
	it "can display a menu" do
		expect{ cart.view_menu }.to output(/Chirashi/).to_stdout
	end
	
	it "stages a list of items for purchase" do
		cart.select(1,3)
		expect(cart.selection).to include({:name=>"Miso", :price=>2})
	end
end