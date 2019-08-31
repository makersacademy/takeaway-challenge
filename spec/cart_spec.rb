require './lib/cart'

describe Cart do
	let(:cart) { Cart.new }
	it "can display a menu" do
		expect{ cart.view_menu }.to output(/Chirashi/).to_stdout
	end
	
	it "stages a list of items for purchase" do
		cart.select(1,3)
		expect(cart.selection).to include("Miso")
	end
	
	it "lets the customer review selected items before purchase" do
		cart.select(3)
		expect{ cart.show_cart }.to output("Your order: Sushi combo B. Total: £11\n").to_stdout
	end
	
	it "displays an order total" do
		cart.select(1,2,3,4,4)
		expect(cart.order_total).to eq(39)
	end
end