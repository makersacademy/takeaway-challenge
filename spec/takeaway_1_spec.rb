require 'takeaway_1'

describe TakeAway do
  subject(:takeaway) { described_class.new }

  let(:dishes) do
    {
      hotdog: 5.00,
      fries: 3.50
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

end
