require 'takeaway_1'

describe TakeAway do
  subject(:takeaway) { described_class.new }

  let(:dishes) do
    {
      hotdog: 5.00,
      fries: 3.50
    }
  end

  let(:order) do
    {
      hotdog: 2,
      fries: 1
    }
  end

  it "creates a new takeaway" do
    expect(takeaway).to be_a_kind_of TakeAway
  end

  it "has a list of dishes with prices" do
    expect(takeaway.dishes).to eq(dishes)
  end

  it "shows the menu when called" do
    printed_menu = "Hotdog £5.00, Fries £3.50"
    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it "selects several dishes from the menu" do
    takeaway.add(:hotdog, 2)
    takeaway.add(:fries, 1)
    expect(takeaway.order).to eq(order)
  end

  it "calculates the total for the order" do
    takeaway.add(:hotdog, 2)
    takeaway.add(:fries, 1)
    total = 13.50
    expect(takeaway.total).to eq(total)
  end

  it "tells if a dish is on the menu" do
    expect(takeaway.has_dish?(:hotdog)).to be true
  end

  it "tells if a dish is not on the menu" do
    expect(takeaway.has_dish?(:hamburger)).to be false
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(takeaway).to receive(:has_dish?).with(:hotdog).and_return(true)
    allow(takeaway).to receive(:has_dish?).with(:fries).and_return(true)
    allow(takeaway).to receive(:has_dish?).with(:hamburger).and_return(false)
    expect { takeaway.add(:hamburger, 2) }.to raise_error "Hamburger is not on the menu!"
  end

  it "sends an SMS when the order has been placed" do
    takeaway.add(:hotdog, 2)
    takeaway.add(:fries, 1)
  end 

end
