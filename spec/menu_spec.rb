require "menu"

describe Menu do

  subject(:menu) { Menu.new(items) }

  let(:items) { { Margerita: 9, Pepperoni: 11, Vegetable: 10 } }
  
  it "lists the items and prices" do
    expect(subject.items).to eq(items)
  end 

  it "prints list of items and prices" do
    expect(subject.prints).to eq("Margerita £9, Pepperoni £11, Vegetable £10")
  end
  
  it "tells if an item is on the menu" do
    expect(subject.include_item?(:Margerita)).to be(true)
  end

  it "tells if an item is not on the menu" do
    expect(subject.include_item?(:Chicken)).to be(false)
  end

  it "calculates a price" do
    expect(subject.price(:Margerita)).to eq(items[:Margerita]) 
  end
  
end
