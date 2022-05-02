require 'order'

describe Order do
  subject(:order) {described_class.new(menu)}
  let(:menu) {double(:menu)}
  let(:dishes) {
    {
      "Prawn Toast": 2,
      "Siu Mai": 1
    }}

  before do
    allow(menu).to receive(:has_dish?).with(:"Prawn Toast").and_return(true)
    allow(menu).to receive(:has_dish?).with(:"Siu Mai").and_return(true)
  end

  it "selects several dishes from the menu" do
    order.add(:"Prawn Toast", 2)
    order.add(:"Siu Mai", 1)
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:"Onion Bhaji").and_return(false)
    expect { order.add(:"Onion Bhaji", 2) }.to raise_error NoItemError, "Onion bhaji is not on the menu!"
  end

end