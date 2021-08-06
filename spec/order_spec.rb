require 'order'

describe Order do
  
  let(:dishes) { double :dishes }

  menu_hash = {
    "Noodles" => 2.99, 
    "Chips" => 2.49, 
    "Pasta" => 5.99
  }
  
  subject { described_class.new(dishes) }
  
  before(:each) do
    allow(dishes).to receive(:menu) { menu_hash }
  end
  
  it "creates an empty array for the order" do
    expect(subject.order).to be_empty
  end
  
  it "allows user to select available dish which is added to order" do
    subject.add_dish("Pasta")
    expect(subject.order).to include("Pasta")
  end

  it "prevents user from selecting unavailable dishes" do
    subject.add_dish("Chop Suey")
    expect(subject.order).to_not include("Chop Suey")
  end

end
