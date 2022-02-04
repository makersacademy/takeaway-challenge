require "./lib/order.rb"

describe Order do

    let(:menu) {double(:menu_list)}
    let(:order) {Order.new(menu)}

    let(:dish1) { double(:name => 'Dish 1', :price => 10.00 )}
    let(:dish2) { double(:name => 'Dish 2', :price => 15.00 )}

    describe "#initialize" do
        it "should contain a menu on intialize" do
            expect(order.order_menu).to eq menu
        end

        it "should contain a empty selection on intialize" do
            expect(order.selection).to be_empty
        end

        it "should contain an empty total on initialize" do
            expect(order.total). to eq 0
        end
    end

    describe "#add_selection" do
        it "should add customers choice into selection" do
            selection = dish1
            order.add_selection(selection)
            expect(order.selection).to include selection
        end

        it "should update the total after each addition" do
            order.add_selection(dish1)
            expect(order.total).to eq dish1.price
            order.add_selection(dish2)
            expect(order.total).to eq (dish1.price + dish2.price)
        end

        it "should show the dish added and updated total to the customer after each addition" do   
            expect{order.add_selection(dish1)}.to output("You have ordered: Dish 1 - £10.0\nYour total so far: £10.0\n").to_stdout
        end
    end

    describe "#checkout" do
        it "should show final selection and total at checkout" do
            order.add_selection(dish1)
            order.add_selection(dish1)
            order.add_selection(dish2)
            order.add_selection(dish2)
            expect{order.checkout}.to output("Order\nDish 1 - £10.0\nDish 1 - £10.0\nDish 2 - £15.0\nDish 2 - £15.0\n--------------\nTotal: £50.0\n").to_stdout
        end
    end

    

end