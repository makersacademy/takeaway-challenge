require "takeaway"

describe Takeaway do
  let(:menu) { { "Chicken Curry" => 4, "Lamb Curry" => 4, "Vegetable Curry" => 3, "Keema" => 4, 
    "Mixed Grill" => 9, "Samosa" => 2, "Chicken Kebab" => 3, "Lamb Kebab" => 4 } 
  }

  describe "#initialize" do
    it "has a menu" do
      expect(subject.menu).to eq(menu)
    end

    it "initially has an empty basket" do
      expect(subject.basket).to eq({})
    end
  end

  describe '#display_menu' do
    it "responds to the method" do
      expect(subject).to respond_to(:display_menu)
    end
  end
end
