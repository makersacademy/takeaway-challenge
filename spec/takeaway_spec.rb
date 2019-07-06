require 'Takeaway'

describe Takeaway do
  let(:takeaway) {described_class.new}

  it "prints a list with prices" do
    expect(takeaway.list).to include("1 Kappa Maki => £8")
  end

  it "puts dishes ordered into an array" do
    expect(takeaway.order(1)).to eq [{"Kappa Maki" => 8}]
  end

  it "gives total" do
    takeaway.order(2)
    takeaway.order(4)
    expect(takeaway.total).to eq 11
  end
end
