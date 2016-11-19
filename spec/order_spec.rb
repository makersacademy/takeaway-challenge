require './lib/order.rb'

describe Order do

  subject(:order) {described_class.new}

  context "Storing ordered dishes" do
    it "should be able to store the dishes ordered" do
      expect(order.selected_dishes).to be_a(Array)
    end
  end

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

    it "should count duplicate dishes and return in a list" do
      allow(order).to receive(:selected_dishes) {[{"Chicken Adobo"=>4.5}, {"Chicken Adobo"=>4.5}]}
      expect(order.view_order).to eq({"Chicken Adobo"=>9.0})
    end

  end

end
