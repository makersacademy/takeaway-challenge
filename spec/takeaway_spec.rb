require 'takeaway'

describe Takeaway do
  let(:portuguese_menu) { double("Menu") }

  it "will present a menu with a list of dishes and prices" do
    takeaway = Takeaway.new(portuguese_menu)
    allow(portuguese_menu).to receive(:dishes) { [{name: "Bacalhau com natas", price: 7.5}] }
    expect(takeaway.print_menu).to eq("Bacalhau com natas: 7.5\n")
  end
end
