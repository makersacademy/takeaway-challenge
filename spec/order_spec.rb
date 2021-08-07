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

  
end
