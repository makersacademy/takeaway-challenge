require "./lib/takeaway.rb"

describe Takeaway do

  let(:empty_menu) { double :menu, dishes: Array.new }
  let(:dish) { double :dish, name: "pizza", price: 0.99, nil?: false }
  let(:second_dish) { double :dish, name: "garlic bread", price: 0.50, nil?: false }
  let(:menu) { double :menu, dishes: [dish], get_dish: dish }
#   before do
#     allow(menu.get_dish).to receive("pizza").and_return("pizza")
#   end

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
  
  context "when dish added to order is not part of the menu" do
    it "raises error" do
      expect { subject.order("chips") }.to raise_error "chips dish is not in the menu" 
    end
  end

  it { is_expected.to respond_to(:add).with(2).argument }

  it { is_expected.to respond_to(:total).with(0).argument }

  it "returns the total value of the order" do
    subject = described_class.new(menu)
    subject.order("pizza", 2)
    subject.add("pizza")
    expect(subject.total).to eq("Total: £2.97")
  end

  it { is_expected.to respond_to(:basket_summary).with(0).argument }

  context "after ordering 2 pizza" do
    it "the basket_summary should return 'pizza x2 = £1.98'" do
      subject = Takeaway.new(menu)
      subject.order("pizza")
      subject.add("pizza")
      expect(subject.basket_summary).to eq("pizza x2 = £1.98")
    end
  end

  it { is_expected.to respond_to(:checkout).with(0).argument }

  it "raises error on checkout if basket is empty" do
    expect { subject.checkout }.to raise_error("your basket is empty")
  end

end
