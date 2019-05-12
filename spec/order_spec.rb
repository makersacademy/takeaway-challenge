require 'order'

describe Order do

  it "allows me to create a new order" do
    expect(subject).to eq subject
  end

  it "allows me to add dishes and quantities to order" do
    expect(subject.add("Pasta", 2)).to eq [{ dish: "Pasta", quantity: 2 }]
  end

end
