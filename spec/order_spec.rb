require 'order'
require 'menu'

describe Order do
  subject(:main_order) { described_class.new }

  let(:order) do
    {
      hotdog: 2,
      fries: 1
    }
  end

  it "responds to add a dish" do
    expect(main_order).to respond_to(:add).with(2).argument
  end

  it "selects several dishes from the menu" do
    main_order.add(:hotdog, 2)
    main_order.add(:fries, 1)
    expect(main_order.order).to eq(order)
  end

  it "calculates the total for the order" do
    main_order.add(:hotdog, 2)
    main_order.add(:fries, 1)
    total = 13.50
    expect(main_order.total).to eq(total)
  end

  it "tells if a dish is on the menu" do
    expect(main_order.has_dish?(:hotdog)).to be true
  end

  it "tells if a dish is not on the menu" do
    expect(main_order.has_dish?(:hamburger)).to be false
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(main_order).to receive(:has_dish?).with(:hotdog).and_return(true)
    allow(main_order).to receive(:has_dish?).with(:fries).and_return(true)
    allow(main_order).to receive(:has_dish?).with(:hamburger).and_return(false)
    expect { main_order.add(:hamburger, 2) }.to raise_error "Hamburger is not on the menu!"
  end

end
