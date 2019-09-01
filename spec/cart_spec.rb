require './lib/cart'

describe Cart do
  let(:cart) { Cart.new }
  it "can display a menu" do
    expect { cart.view_menu }.to output(/Chirashi/).to_stdout
  end
	
  it "stages a list of items for purchase" do
    cart.select(1, 3)
    expect(cart.selection).to include("Miso")
  end
	
  it "lets the customer review selected items before purchase" do
    cart.select(3)
    expect { cart.show_cart }.to output("Your order: Sushi combo B. Total: £11\n").to_stdout
  end
	
  it "allows items to be removed from an order" do
    cart.select(2, 2, 4, 4)
    expect { cart.remove(2, 4) }.to change { cart.selection.count }.by(-2)
  end
	
  it "displays an order total" do
    cart.select(1, 2, 3, 4, 4)
    expect(cart.order_total).to eq(39)
  end
	
  it "corrects the order total if items are removed" do
    cart.select(1, 1, 4, 4)
    expect { cart.remove(1, 4) }.to change { cart.order_total }.by(-11)
  end
end
