require 'takeaway'

describe Takeaway do
let(:takeaway) { Takeaway.new }

  it "prints out the main dishes items and prices" do
    expect(takeaway.view_menu).to eq  "Samosas" => 5.20,
    "Chilli Chicken" => 7.50,
    "Pau Bhaji" => 5.90,
    "Chicken Ruby"  => 12.9, 
    "Mattar Paneer" => 11.9, 
    "Chole" => 9.50,
    "Black Daal" => 7.50
  end
  it "lets the user select items from the menu" do
    expect(takeaway.order('Samosas', 'Chilli Chicken')).to eq ["Samosas", "Chilli Chicken"]
  end
  it "shows the user the total value of their order" do
    expect(takeaway.receipt).to eq "Order"
  end
end