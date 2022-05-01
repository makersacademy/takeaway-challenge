require 'order'
require 'dishes'

describe Order do

  it "has an empty array for new order" do
    expect(subject.basket).to eq Array.new(0)
  end

  it "defines @complete to eq false" do
    expect(subject.complete). to eq false
  end

  describe "#select_dishes" do
    it "returns an array of selected available dishes" do
      expect { subject.select_dishes(1) }.to change { 
        subject.basket }.from(Array.new(0)).to([{name: "Diet (not really) Pizza", price: 5.99}])
    end

    it "raises an error when dish is not available" do
      expect { subject.select_dishes(16) }.to raise_error("Dish is not available. Please choose a different dish.")
    end

    it "returns an array of selected available dishes" do
      expect { subject.select_dishes(5) }.to change { 
        subject.basket }.from(Array.new(0)).to([{name: "Once in a lifetime Pizza", price: 9.99}])
    end

    it "raises an error when order is complete" do
      subject.confirm_order
      expect{subject.select_dishes(1)}.to raise_error "Order already confirmed and can't be changed."
    end
  end

  describe "#delete_dishes" do
    it "removes the dish from an array" do
      subject.select_dishes(1)
      expect(subject.delete_dishes(1)).to eq (Array.new(0))
    end
    
    it "removes the dish from an array and leaves other items in the basket" do
      subject.select_dishes(1)
      subject.select_dishes(5)
      expect(subject.delete_dishes(1)).to eq ([{name: "Once in a lifetime Pizza", price: 9.99}])
    end

    it "raises an error when order is complete" do
      subject.confirm_order
      expect{subject.delete_dishes(1)}.to raise_error "Order already confirmed and can't be changed."
    end
  end

  describe "#check_total" do
    it "checks the total and the sum of 1 item" do
      subject.select_dishes(1)
      expect(subject.check_total).to eq "£5.99"
    end

    it "checks the total and the sum of 2 items" do
      subject.select_dishes(1)
      subject.select_dishes(5)
      expect(subject.check_total).to eq "£15.98"
    end

    it "checks the total and the sum of 0 items" do
      expect(subject.check_total).to eq "£0"
    end
  end

  describe "#confirm_order" do
    it "returns the true and confirms the order when the total is correct" do
      subject.confirm_order
      expect(subject.complete).to eq true
    end

    it "puts message confirming the order" do
      expect { subject.confirm_order }.to output(<<~output
        Order complete.
      output
    ).to_stdout
    end
  end
end
