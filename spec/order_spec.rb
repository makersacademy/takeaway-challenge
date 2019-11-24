require 'order'

describe Order do
  let(:menu_double) { double :menu }
  subject(:order) { described_class.new(menu_double) }

  before do
    allow(menu_double).to receive(:dish?).with(:chips).and_return(true)
    allow(menu_double).to receive(:dish?).with(:rice).and_return(true)
    allow(menu_double).to receive(:dish?).with(:fish).and_return(true)
    allow(menu_double).to receive(:price).with(:chips).and_return(3)
    allow(menu_double).to receive(:price).with(:rice).and_return(2.5)
    allow(menu_double).to receive(:price).with(:fish).and_return(7)
  end

  it "selects dishes from the menu" do
    expect { order.add_to_basket(:rice, 1) }.to output("added 1 rice to basket.\n").to_stdout
  end

  it "raise an error when the item is not on the menu" do
    allow(menu_double).to receive(:dish?).with(:beef).and_return(false)
    expect { order.add_to_basket(:beef, 1) }.to raise_error "This item is not on the menu!"
  end

  it "calculates the price per dish by quantity" do
    order.add_to_basket(:chips, 2)
    expect(order.total_per_dish).to eq [6]
  end

  it "calculates the total price of the order" do
    order.add_to_basket(:chips, 2)
    order.add_to_basket(:rice, 2)
    order.total_per_dish
    expect(order.bill).to eq 11
  end
end
