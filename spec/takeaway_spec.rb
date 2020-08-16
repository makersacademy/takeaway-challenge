describe Takeaway do

  let(:menu) { double("menu") }
  let(:order) { double("order") }

  let(subject) { described_class(menu,order) }

  it "has a menu" do
    expect(subject.menu).to eq menu
  end

  it "has an order" do
    expect(subject.order).to eq order
  end

end
