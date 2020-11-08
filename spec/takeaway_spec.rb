require 'takeaway'

describe Takeaway do
  let(:portuguese_menu) { double("Menu") }

  it "will present a menu with a list of dishes and prices" do
    takeaway = Takeaway.new(portuguese_menu)
    allow(portuguese_menu).to receive(:dishes) { [{name: "Bacalhau com natas", price: 7.5}] }
    expect(takeaway.print_menu).to eq("1. Bacalhau com natas: 7.5\n")
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it "allow the users to choose the dishes they want to order" do
    takeaway = Takeaway.new(portuguese_menu)
    allow(portuguese_menu).to receive(:dishes) { [{name: "Bacalhau com natas", price: 7.5}] }
    takeaway.order(1)
    expect(takeaway.orders_list).to include(1)
  end

  it "will raise an error in the case the user enter an unexisting number" do
    takeaway = Takeaway.new(portuguese_menu)
    allow(portuguese_menu).to receive(:dishes) { [{name: "Bacalhau com natas", price: 7.5}] }
    expect { takeaway.order(2) }.to raise_error "The number you chose it's not associated to any dish"
  end

  it "allow the users to choose more than one dish" do
    takeaway = Takeaway.new(portuguese_menu)
    allow(portuguese_menu).to receive(:dishes) { [{name: "Bacalhau com natas", price: 7.5}, {name: "Ameijoas a Bulhao Pato", price: 8}, {name: "Polvo a Lagareiro", price: 10}] }
    takeaway.order(1)
    takeaway.order(3)
    expect(takeaway.orders_list).to include(1, 3)
  end
end
