require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double :menu }

  let(:items) do
    { cheeseburger: 3, hamburger: 1, fries: 3 }
  end

  before do
    allow(menu).to receive(:is_available?).with(:cheeseburger).and_return(true)
    allow(menu).to receive(:is_available?).with(:hamburger).and_return(true)
    allow(menu).to receive(:is_available?).with(:fries).and_return(true)
  end


  it "should add the selected items from the menu" do
    order.add(:cheeseburger, 3)
    order.add(:hamburger, 1)
    order.add(:fries, 3)
    expect(order.items).to eq items
  end

  it "should not add items to the order that are not on the menu" do
    allow(menu).to receive(:is_available?).with(:noodles).and_return(false)
    expect { order.add(:noodles, 2) }.to raise_error NoItemError, "Noodles is not a valid menu item"
  end

end
