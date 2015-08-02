require "takeaway"
describe "Features" do
  describe "takeaway" do
    let (:takeaway) { Takeaway.new }
    describe "#menu" do
      it "displays menu items and prices" do
        our_menu = { "pizza" => 5.95, "pasta" => 6.45, "curry" => 6.95, "toast" => 0.1, "fajitas" => 6.45, "bacon sandwich" => 3.50, "steak and chips" => 10.95 }
        expect(takeaway.menu).to eq our_menu 
      end
    end
    describe "#place_order" do
      it "places order of dishes" do
        takeaway.place_order("pizza", "pasta", 12.40)
        expect(takeaway.order).to eq ["pizza", "pasta"]
      end
      it "doesn't accept orders of items not on the menu" do 
        expect { takeaway.place_order("steak and chips", "toast", "grilled baby", 15.00) }.to raise_error "Apologies, we do not have grilled baby on the menu."
      end
      it "takes a customers price and compares to what it should be" do
        takeaway.place_order("pizza", "pasta", "curry", 19.35)
        expect(takeaway).to be_same_price
      end
      it "raises error if price entered is not the same as the order total" do
        expect { takeaway.place_order("pizza", "pasta", "curry", 1) }.to raise_error "Your order costs £19.35 not £1"
      end
    end
  end
end