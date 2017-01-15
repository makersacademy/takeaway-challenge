require 'order'

describe Order do
  subject(:order) {described_class.new(menu) }
  let(:menu) { double(:menu) }
  let(:dishes) do
    {
      "crispy seaweed" => 2,
      "kung po chicken" => 1
    }
  end

  before do
      allow(menu).to receive(:has_dish?).with("crispy seaweed").and_return(true)
      allow(menu).to receive(:has_dish?).with("kung po chicken").and_return(true)
  end

  it "selects several dishes from the menu" do
    order.add("crispy seaweed", 2)
    order.add("kung po chicken", 1)
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with("beef").and_return(false)
    expect {order.add("beef", 2) }.to raise_error NoItemError, "Beef is not on the menu!"
  end
end
