require 'order'
require 'pry'

describe Order do
  let(:burger) { double(:Item, name: "Burger", price: 6) }
  let(:coke) { double(:Item, name: "Coke", price: 2) }
  before "add food to order" do
    subject.add(burger, 2)
    subject.add(coke, 2)
  end
  it "can remove items" do
    subject.remove(coke)
    expect(subject.current_order).not_to include coke
  end
  it "can view the current order" do
    subject.remove(coke)
    expect(STDOUT).to receive(:puts).twice.with('Burger - £6')
    subject.view
  end
  context "calculating the total cost" do
    it "should be £16 for 2x burger and 2x coke" do
      expect(subject.total).to eq 16
    end
  end
end
