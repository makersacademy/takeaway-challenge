require 'takeaway'

describe Takeaway do
let(:takeaway) { Takeaway.new }

  it "prints out the main dishes items and prices" do
    expect(takeaway.view_menu).to eq  "Samosas" => 5,
    "Chilli Chicken" => 7,
    "Pau Bhaji" => 5,
    "Chicken Ruby"  => 12, 
    "Mattar Paneer" => 11, 
    "Chole" => 9,
    "Black Daal" => 7
  end

  it "lets the user select items from the menu" do
    expect(takeaway.select_dishes('Samosas', 'Chilli Chicken')).to eq ["Samosas", "Chilli Chicken"]
  end
  it "shows the user the total value of their order" do
    takeaway.select_dishes('Samosas', 'Chilli Chicken')
    expect(takeaway.check_total).to eq 12
  end
end