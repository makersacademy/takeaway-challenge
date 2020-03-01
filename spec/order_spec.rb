require 'order'

describe Order do

  describe "#initialize" do

    it "initializes with an empty @current_order" do
      expect(subject.current_order).to eq []
    end

    it "initializes with an empty @prices_to_sum" do
      expect(subject.prices_to_sum).to eq []
    end
  end
  
  describe "#add_dish" do

    it "raises an error if #add_dish and it doesn't exist" do
      expect { subject.add_dish("omelette", 0) }.to raise_error("Sorry, that dish is not available")
    end

    it "can #add_dish to @current_order" do
      subject.add_dish("Cheese Burger", 1)
      expect(subject.current_order).to include("Cheese Burger ...... £5")
    end

    it "can add the price of the dish to @prices_to_sum" do
      subject.add_dish("Cheese Burger", 2)
      expect(subject.prices_to_sum).to include(5)
    end
  end

  describe "#existent_dish?" do
    it "can check if #existent_dish in @menu" do
      expect(subject.existent_dish?("Cheese Burger")).to eq true
    end
  end

  describe "#total_price" do

    it "#sum_price returns the @total_price" do
      subject.send(:sum_price)
      subject.add_dish("Cheese Burger", 1)
      subject.add_dish("Milkshake", 1)
      subject.sum_price
      expect(subject.total_price).to eq 8
    end
  end

  describe "#print_order" do

    it "print_order returns a list with @current_order and @total_price" do
      subject.add_dish("Cheese Burger", 2)
      subject.add_dish("Milkshake", 2)
      subject.sum_price
      expect { subject.print_order }.to output { subject.print_order }.to_stdout
    end
  end
end
