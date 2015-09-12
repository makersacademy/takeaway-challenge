require 'customer.rb'

describe Customer do

  it { is_expected.to respond_to(:make_order).with(2).argument }

  it "raises error if customer selects a dish that's not on the menu" do
    expect{ subject.make_order("pasta", 1) }.to raise_error
    "Sorry! That dish is not on the menu"
  end

  it "can select a dish and quantity" do
    subject.make_order("chicken katsu", 2)
    expect( subject.order["chicken katsu"] ).to eq(2)
  end

  it "can select some number of several available dishes" do
    subject.make_order("chicken katsu", 2)
    subject.make_order("miso soup", 2)
    expect(subject.order).to eq({"chicken katsu" => 2, "miso soup" => 2})
  end

  it "can will add the quantity of a dish if ordered again" do
    subject.make_order("chicken katsu", 2)
    subject.make_order("chicken katsu", 2)
    expect( subject.order["chicken katsu"] ).to eq(4)
  end

  it "provides a summary of te total order" do
    subject.make_order("chicken katsu", 2)
    subject.make_order("miso soup", 2)
    expect(subject.order_summary.to eq
    ("2 chicken katsu, 2 miso soup")
  end

  it "calculates total order" do
    subject.make_order("chicken katsu", 2)
    subject.make_order("miso soup", 2)
    expect(subject.charge).to eq("The total of your order is £10.00")
  end

end
