require 'order'

describe Order do
  it "initializes the order with an empty array" do
    expect(subject.ordered_items.empty?).to eq true
  end

  it "adds a dish to the order array" do
    subject.add_item("chips")
    expect(subject.ordered_items.length).to eq 1
  end

  # it "raises exception if user tries to order something not on the menu" do
  #   expect{ subject.add_item("ramen") }.to raise_error "The item is not on the menu."
  # end

  it "raises exception if user tries to end order without adding anything to order" do
    receipt = double("receipt")
    expect { subject.end_order(receipt) }.to raise_error "You haven't yet added any items."
  end
end
