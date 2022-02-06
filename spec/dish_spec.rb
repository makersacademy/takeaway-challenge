require "dish"

describe Dish do

  subject { Dish.new(1, "Kebab", 30, 8.00) }

  describe "when initializing" do

    it "will return the dish identifier" do
      expect(subject.identifier).to eq(1)
    end

    it "will return the dish name" do
      expect(subject.name).to eq("Kebab")
    end

    it "will return the quantity_available for the dish" do
      expect(subject.quantity_available).to eq(30)
    end

    it "will return the price of a dish" do
      expect(subject.price).to eq 8.00
    end

    it "will return the name and price of a dish" do
      expect(subject.view_price).to eq({ "Kebab" => 8.00 })
    end
  
    it "will return the name and quantity available of a dish" do
      expect(subject.view_quantity_available).to eq({ "Kebab" => 30 })
    end

  end

  describe "when updating or checking a quantity for a dish" do

    it "reduces the quantity by one when one is ordered" do
      expect { subject.order(1) }.to change { subject.quantity_available }.by(-1)
    end
    it "raise an error if not enough is available to satisfy an order " do
      expect { subject.order(40) }.to raise_error("Order cannot be fulfilled as not enough available")
    end

  end

end
