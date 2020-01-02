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
  
end
