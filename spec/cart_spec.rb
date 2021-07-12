require "cart"



describe "Order" do 
    describe "#initialize" do
        it "Creates an empty array for the Cart" do
            cart = Cart.new
            expect(cart.in_cart).to eq []
        end
    end

    describe "#add_to_cart" do
        xit "creates an order_item with dish properties and adds it to the cart" do
            dish = Dish.new("Pasta", 2)
            menu = Menu.new("Menu_July")
            menu.add(dish)
            cart = Cart.new
            cart.add_to_cart(1)
            expect(cart.in_cart).to eq [order_item]
        end

        it "to raise an error if a dish ordered is not on the menu" do
            dish = Dish.new("Pasta", 2)
            menu = Menu.new("Menu_July")
            menu.add(dish)
            cart = Cart.new
            expect { cart.add_to_cart(5) }.to raise_error "Dish not in the Menu, try again!"
        end
            
    end
end




