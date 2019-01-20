require 'takeaway'

RSpec.describe Takeaway do

  context "#show_menu" do
    it "should print the menu" do
      expect(subject.show_menu).to be_kind_of Menu
    end
  end

  context "#place_order" do
    it "should return a hash of quantity and Dish instance" do
      expect(subject.place_order(5, "Cheeseburger")).to eq(33.95)
    end

    it "should return multiple orders in a hash" do
      subject.place_order(2, "Cheeseburger")
      expect(subject.place_order(2, "Chicken Wings")).to eq(25.56)
    end
  end

  context "#update_total_order" do
    it "should raise an error for wrong estimated total" do
      subject.place_order(2, "Cheeseburger")
      expect { subject.complete_order(4) }.to raise_error 'Total incorrect'
    end

    it "should confirm the order" do
      subject.place_order(2, "Cheeseburger")
      expect(subject.complete_order(13.58)).to eq 'Order confirmed'
    end
  end
end
