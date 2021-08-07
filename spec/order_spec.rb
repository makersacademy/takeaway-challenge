require 'order'

describe Order do
    
  let(:inventory) { double :inventory }

  mock_inventory = {
    "Item 1" => 0.99, 
    "Item 2" => 1.49, 
    "Item 3" => 1.99
  }
  
  subject { described_class.new(mock_inventory) }

  it "creates an empty array for the order" do
    expect(subject.order).to be_empty
  end
  
  it "allows user to select available item which is added to order" do
    subject.add("Item 1")
    expect(subject.order).to include("Item 1")
  end

  it "prevents user from selecting unavailable dishes" do
    subject.add("Chop Suey")
    expect(subject.order).to_not include("Chop Suey")
  end

end
