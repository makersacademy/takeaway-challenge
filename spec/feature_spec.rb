require "takeaway"
describe "Features" do
  describe "takeaway" do
    let (:takeaway) { Takeaway.new }
    it "displays menu items and prices" do
      our_menu = { "pizza" => 5.95, "pasta" => 6.45, "curry" => 6.95, "toast" => 0.1, "fajitas" => 6.45, "bacon sandwich" => 3.50, "steak and chips" => 10.95 }
      expect(takeaway.menu).to eq our_menu 
    end
    it "places order of dishes" do
      takeaway.place_order("pizza", "pasta")
      expect(takeaway.order).to eq ["pizza", "pasta"]
    end
    it "doesn't accept orders of items not on the menu" do 
      expect { takeaway.place_order("steak and chips", "toast", "grilled baby") }.to raise_error "Apologies, we do not have grilled baby on the menu."
    end
  end
end