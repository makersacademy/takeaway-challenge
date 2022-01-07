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

    it "returns the menu" do
      expect(subject.display_menu).to eq(menu)
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

  describe "#total_price" do
    it "can caculate the price when ordering a single item" do
      subject.add("Chicken Curry", 1)
      expect(subject.total_price).to eq 4
    end

    it "can calculate the price when ordering multiple of a single item" do
      subject.add("Chicken Curry", 2)
      expect(subject.total_price).to eq 8
    end

    it "can calculate the price when ordering multiple items" do
      subject.add("Chicken Curry", 2)
      subject.add("Samosa", 4)
      expect(subject.total_price).to eq 16
    end
  end

  describe "#place_order" do
    it "places an order" do
      subject.stub(:send_sms).and_return("Order placed! Total: £16")
      subject.add("Chicken Curry", 2)
      subject.add("Samosa", 4)
      expect(subject.place_order).to eq([{}, 0])
    end

    it "resets the basket after placing the order" do
      subject.stub(:send_sms).and_return([{}, 0])
      subject.add("Chicken Curry", 2)
      subject.add("Samosa", 4)
      subject.place_order
      expect(subject.basket).to eq({})
    end

    it "sends an sms after placing order" do
      subject.stub(:send_sms).and_return([{}, 0])
      expect(subject).to receive(:send_sms)
      subject.add("Chicken Curry", 2)
      subject.add("Samosa", 4)
      subject.place_order
    end
  end

  describe '#send_sms' do
    it "responds to the method" do
      expect(subject).to respond_to(:send_sms)
    end
  end
end
