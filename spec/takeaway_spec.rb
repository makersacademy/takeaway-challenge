require "takeaway"

describe TakeAway do

  it "checks checks input is on the menu" do
    expect(subject.valid?("blahh")).to eq false
  end

  it "returns menu when called" do
    expect(subject.show_menu).to_not be_empty 
  end

  describe "#add" do

    it "errors when item is not on the menu" do
      input = "blahh"
      expect(subject.add(input)).to eq("I'm afraid we don't have any #{input}")
    end

    it "execpts vaild input" do
      input = "pizza"
      expect(subject.add(input)).to eq("#{input} added to your order")
    end

    it "return order status when complete" do
      expect(subject.complete).to eq "Order complete, your total is £0"

    end

  end

end