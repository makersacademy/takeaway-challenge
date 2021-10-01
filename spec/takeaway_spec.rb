require "takeaway"

describe TakeAway do
  describe "#show_menu" do
    it "displays a list of food with prices" do
      expect(subject.show_menu).to eq [{dish: "fish and chips", price: 6.99}] 
    end

    it "displays food from the stored menu" do
      expect(subject.show_menu).to eq subject.instance_variable_get(:@menu)
    end
  end

  # describe "#new_order" do
  #   it "allows users to select a specified quantity of dishes" do
  #     expect(subject.new_order("fish and chips",3)).to eq([{dish: "fish and chips", price: 6.99, quantity: 3}])
  #   end
  # end
end