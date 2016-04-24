require "order"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }
  let(:dishes) { { arepa: 4, empanada: 5 } }

  before do
    allow(menu).to receive(:has_name?).with(:arepa).and_return(true)
    allow(menu).to receive(:has_name?).with(:empanada).and_return(true)
  end

  it "chooses several dishes from the menu" do
    order.add(:arepa, 4)
    order.add(:empanada, 5)
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be ordered that are not on menu" do
    allow(menu).to receive(:has_name?).with(:platain).and_return(false)
    expect{ order.add(:platain, 2) }.to raise_error "Platain is not on the menu!"
  end
end
