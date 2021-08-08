require "./lib/takeaway.rb"

describe Takeaway do
  let(:empty_menu) { double :menu, dishes: Array.new }
  let(:dish){ double :dish, name: "pizza", price: 0.99 }
  let(:menu){ double :menu, dishes: [dish] }

  it "shows the Menu class to have a method read_menu" do
    expect(subject).to respond_to :read_menu
  end

  it "shows menu dishes not to be empty" do
    expect(subject.read_menu.empty?).to eq(false)
  end

  it "shows menu dishes to be empty" do
    subject = described_class.new(empty_menu)
    expect(subject.read_menu).to eq("the menu is empty")
  end

  it { is_expected.to respond_to(:order).with(2).argument }

  it "expects the order items to contain 3 item" do
    subject = described_class.new(menu)
    subject.order("pizza", 3)
    expect(subject.order_now.items.count).to eq(3)
  end

end
