require 'order'
describe Order do
  
  it "allows items to be ordered" do
    subject.add_to_basket("Samosa")
    expect(subject.order_basket).to eq({ "Samosa" => 1 })
  end

  it "calculates how much the order is" do
    subject.add_to_basket("Samosa")
    expect(subject.total).to eq 1.70
  end

  it "displays a summary of the current order" do
    subject.add_to_basket("Samosa", 2)
    expect(subject.summary).to eq("2x Samosa £3.40 ")
  end
end
