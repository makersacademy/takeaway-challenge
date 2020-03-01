require "order"

describe Order do
  describe "#add_to_order" do
    it "adds dishes to the order" do 
      test_menu = [{ dish: "Potatoes", price: 3.95 }]     
      expect(subject.add_to_order(test_menu[0], 2)).to eq([{ dish: "Potatoes", price: 3.95 }, { dish: "Potatoes", price: 3.95 }])
    end
  end
end
