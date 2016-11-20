require './lib/order.rb'

describe Order do

  subject(:order) {described_class.new}

  context "Total price of all selected dishes" do
    it "should raise error if selected dishes is empty" do
      expect{order.total_cost}.to raise_error "No dishes selected."
    end

    it "should return the cost of the dishes selected" do
      allow(order).to receive(:selected_dishes) {[{"Chicken Adobo"=>4.5}, {"Chicken Adobo"=>4.5}]}
      expect(order.total_cost).to eq "£9.0"
    end
  end

  context "View ordered dishes" do
    it "should count duplicate dishes and return in a list with total price" do
      allow(order).to receive(:selected_dishes) {[{"Chicken Adobo"=>4.5}, {"Chicken Adobo"=>4.5}]}
      expect(order.view_order).to eq({{"Chicken Adobo"=>4.5}=>2, "Total cost:" => "£9.0"})
    end

    it "should raise error if there is no selected dishes" do
      expect{order.view_order}.to raise_error("No dishes selected.")
    end
  end

end
