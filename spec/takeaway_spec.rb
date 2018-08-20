require 'takeaway'

describe Takeaway do
  
  describe "#display_menu" do
    it "should be able to access the menu" do
      expect(subject.display_menu).to be_a_kind_of(Hash)
    end
  end

  describe "#add_item" do
    it "should add item to basket" do
      subject.add_item("congee", 3)
      expect(subject.basket).to eq(["Congee", "Congee", "Congee"])
    end
  end

  describe "#calculate_total" do
    it "should calculate the total payable" do
      subject.add_item("congee", 3)
      expect(subject.calculate_total).to eq(6)
    end
  end

  describe "#checkout" do
    let(:takeaway_double) { double(:takeaway, checkout: 6) }

    it "should check that the total I've given matches sum of dishes ordered" do
      subject.add_item("congee", 3)
      subject.calculate_total
      expect(takeaway_double.checkout(6)).to eq(subject.calculate_total)
    end
  end

  describe "#send_message" do
    let(:takeaway_double) { double(:takeaway, send_message: "yo") }

    it "should send an sms message upon purchase" do
      expect(takeaway_double.send_message).to eq("yo")
    end
  end
end
