require "order"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }
  let(:dishes) { { arepa: 2, empanada: 4 } }

  before do
    allow(menu).to receive(:has_name?).with(:arepa).and_return(true)
    allow(menu).to receive(:has_name?).with(:empanada).and_return(true)

    allow(menu).to receive(:price).with(:arepa).and_return(5.50)
    allow(menu).to receive(:price).with(:empanada).and_return(2.50)
  end

  it "chooses several dishes from the menu" do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be ordered that are not on menu" do
    allow(menu).to receive(:has_name?).with(:platain).and_return(false)
    expect{ order.add(:platain, 2) }.to raise_error "Platain is not on the menu!"
  end

  it "calculates the total of order" do
    create_order
    total = 21.00
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:arepa, 2)
    order.add(:empanada, 4)
  end
end
