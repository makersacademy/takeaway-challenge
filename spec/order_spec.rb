require 'order'
require 'pry'

describe Order do
  let(:burger) { double(:Item, name: "Burger", price: 6) }
  let(:coke) { double(:Item, name: "Coke", price: 2) }
  before "add food to order" do
    subject.add(burger, 1)
    subject.add(coke, 2)
  end
  it "can remove items" do
    subject.remove(coke)
    expect(subject.current_order).not_to include coke
  end
  describe "#view" do
    before "#view" do
      subject.remove(burger)
      subject.remove(coke)
    end
    it "can view the current order" do
      expect(subject.view).to eq "Your Order\n~~~~~~~~~~~\nNothing in basket!\nTotal = £0"
    end
  end
  context "calculating the bill" do
    it "should be £16 for 2x burger and 2x coke" do
      expect(subject.total).to eq 10
    end
  end
end
