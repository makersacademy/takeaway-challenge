require 'order'

describe Order do

  it "allows me to create a new order" do
    expect(subject).to eq subject
  end

  it "allows me to add dishes and quantities to order" do
    expect(subject.add("Pasta", 2)).to eq "Pasta" => 2
  end

  it "will tell me the order total" do
    subject.add("Pasta", 2)
    subject.add("Spaghetti", 1)
    expect(subject.total).to eq("Your order total is £32")
  end

  it "raises an error if item is not in menu" do
    message = "Item(s) not available, please order again!"
    expect { subject.add("Garlic Bread", 1) }.to raise_error message
  end

end
