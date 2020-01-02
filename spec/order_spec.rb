require "order"

describe Order do

  subject(:order) { Order.new(menu) }

  let(:items) { { Margerita: 1, Pepperoni: 2, Vegetable: 3 } }
  let(:menu) { double(:menu) }

  before do
    allow(menu).to receive(:include_item?).with(:Margerita).and_return(true)
    allow(menu).to receive(:include_item?).with(:Pepperoni).and_return(true)
    allow(menu).to receive(:include_item?).with(:Vegetable).and_return(true)

    allow(menu).to receive(:price).with(:Margerita).and_return(9)
    allow(menu).to receive(:price).with(:Pepperoni).and_return(11)
    allow(menu).to receive(:price).with(:Vegetable).and_return(10)
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

  it "calculates the total for the order" do
    order.add(:Margerita, 1)
    order.add(:Pepperoni, 1)
    order.add(:Vegetable, 1)
    order_total = 30
    expect(order.total).to eq(order_total)
  end

end
