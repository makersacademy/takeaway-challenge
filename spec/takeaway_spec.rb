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

  describe "#add" do
    it "responds to the method with 2 arguments" do
      expect(subject).to respond_to(:add).with(2).arguments
    end

    it "adds an item to the basket" do
      subject.add("Chicken Curry", 2)
      expect(subject.basket).to eq({ "Chicken Curry" => 2 })
    end

    it "adds multiple items to the basket" do
      subject.add("Chicken Curry", 2)
      subject.add("Samosa", 4)
      expect(subject.basket).to eq({ "Chicken Curry" => 2, "Samosa" => 4 })
    end

    it "raises an error when adding an item that is not on the menu" do
      expect { subject.add("Vegan Sausage Roll", 2) }.to raise_error "Your choice is not on the menu"
    end
  end
end
