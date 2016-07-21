require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do
    {
      balti: 2,
      vindaloo: 2
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:balti).and_return(true)
    allow(menu).to receive(:has_dish?).with(:vindaloo).and_return(true)
  end

  it "allows the selection of several dishes to be added to an order" do
    order.add_to_order(:balti, 2)
    order.add_to_order(:vindaloo ,2)
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow dishes to be added to the order that aren't on menu" do
    allow(menu).to receive(:has_dish?).with(:chips).and_return(false)
    expect { order.add_to_order(:chips, 2)}.to raise_error NoItemError, "Chips not on the menu"
  end
 end
