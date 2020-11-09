require 'takeaway'

describe Takeaway do
  it "returns a menu when requested" do
    expect(subject).to respond_to(:read_menu)
  end

  it "returns the full menu when requested" do
    expect(subject.menu.dishes.length).to eq 5
  end

  describe "#order" do
    it "responds to order" do
      expect(subject).to respond_to(:place_order).with(2).arguments
    end

    it "adds an order to the basket" do
      subject.place_order("pizza")
      expect(subject.order.length).to eq 1
    end
  end

  describe "#basket_summary" do
    it "returns summary of the basket" do
      subject.place_order("pizza", 3)
      subject.place_order("burger")
      expect(subject.basket_summary).to eq "pizza x3 = £14.97, burger x1 = £9.99"
    end
  end

  describe "#total" do
    it "returns the basket total" do
      subject.place_order("pizza", 3)
      subject.place_order("burger")
      expect(subject.total).to eq "Total: £24.96"
    end
  end

  subject(:takeaway) { described_class.new }

  before do
    allow(takeaway).to receive(:send_message)
  end

  it 'sends a payment confirmation text message' do
    expect(takeaway).to receive(:send_message)
    takeaway.checkout
  end
end
