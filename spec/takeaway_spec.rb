require 'takeaway'

RSpec.describe Takeaway do

  context "#show_menu" do
    it "should print the menu" do
      subject.menu.add("Cheeseburger", 6.50)
      expect(subject.show_menu).to eq "Cheeseburger at £6.50\n"
    end
  end

  context "#place_order" do
    it "should place the order giving the total cost" do
      subject.menu.add("Cheeseburger", 6.79)
      expect(subject.place_order("Cheeseburger", 5)).to eq(33.95)
    end

    it "should allow me to place multiple orders giving the total cost" do
      subject.menu.add("Cheeseburger", 6.79)
      subject.menu.add("Chicken Wings", 5.99)
      subject.place_order("Cheeseburger", 2)
      expect(subject.place_order("Chicken Wings", 2)).to eq(25.56)
    end
  end

  context "#checkout" do
    it "should raise an error for wrong estimated total" do
      subject.menu.add("Cheeseburger", 6.79)
      subject.place_order("Cheeseburger", 2)
      expect { subject.checkout(4) }.to raise_error 'Total incorrect'
    end

    it "should confirm the order" do
      allow(subject).to receive(:delivery).and_return('SMS confirmation sent')
      subject.menu.add("Cheeseburger", 6.79)
      subject.place_order("Cheeseburger", 2)
      expect(subject.checkout(13.58)).to eq 'SMS confirmation sent'
    end

    it "should clear the order list" do
      allow(subject.order).to receive(:delivery).and_return('SMS confirmation sent')
      subject.menu.add("Cheeseburger", 6.79)
      subject.place_order("Cheeseburger", 2)
      subject.checkout(13.58)
      expect(subject.order.new_order_list).to be_empty
    end

    it "should clear the total cost" do
      allow(subject.order).to receive(:delivery).and_return('SMS confirmation sent')
      subject.menu.add("Cheeseburger", 6.79)
      subject.place_order("Cheeseburger", 2)
      subject.checkout(13.58)
      expect(subject.order.total_cost).to eq 0
    end
  end
end
