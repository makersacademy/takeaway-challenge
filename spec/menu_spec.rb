require 'menu'

describe Menu do
  let(:menu) do
    {"Salted Caramel Shake" => 5.99, "Red Velvet Shake" => 5.99}
  end

  it "tells if a item is on the menu" do
    expect(subject.has_item?("Vanilla Milkshake")).to be true
  end

  it "tells if a dish is not on the menu" do
   expect(subject.has_item?("Coffee")).to be false
 end


  it "has a list of items with prices" do
   expect(subject.menu)
  end

  it "prints a list of items with prices" do
   expect(subject.print)
 end

end
