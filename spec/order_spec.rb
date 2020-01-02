require "order"

describe Order do

  subject(:order) { Order.new(menu) }

  let(:items) { { Margerita: 1, Pepperoni: 2, Vegetable: 3 } }
  let(:menu) { double(:menu) }

  before do
    allow(menu).to receive(:include_item?).with(:Margerita).and_return(true)
    allow(menu).to receive(:include_item?).with(:Pepperoni).and_return(true)
    allow(menu).to receive(:include_item?).with(:Vegetable).and_return(true)
  end

  it "selects several items from menu" do
    order.add(:Margerita, 1)
    order.add(:Pepperoni, 2)
    order.add(:Vegetable, 3)
    expect(order.items).to eq(items)
  end

  it "raise error when non-menu items selected" do
    allow(menu).to receive(:include_item?).with(:Chicken).and_return(false)
    expect { order.add(:Chicken, 1) }.to raise_error "Chicken not avaliable!"
  end

end
