require 'order'
require 'pry'

describe Order do
  let(:burger) { double(:Item, name: "Burger", price: 6) }
  let(:coke) { double(:Item, name: "Coke", price: 2) }
  before "add food to order" do
    subject.add(burger, 2)
    subject.add(coke, 2)
  end
  it "can view the menu" do
    expect(subject.view).to include burger, coke
  end
  context "calculating the total cost" do
    it "should be £16 for 2x burger and 2x coke" do
      expect(subject.total).to eq 16
    end
  end
end
