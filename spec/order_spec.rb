require "order"
require "menu"

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double "Menu" }
  let(:dishes) do
    { fish: 2, chips: 1}
  end

  before do
    allow(menu).to receive(:has_dish?).with(:fish).and_return(true)
    allow(menu).to receive(:has_dish?).with(:chips).and_return(true)
  end


  it "selects several dishes from the menu" do
    order.add(:fish, 2)
    order.add(:chips, 1)
    expect(order.dishes).to eq dishes
  end

  it "does not allow ordering dishes that don't exist in the menu" do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect{ order.add(:beef, 2) }.to raise_error "Beef is not on the menu!"
  end
end
