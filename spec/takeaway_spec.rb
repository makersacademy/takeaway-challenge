require "takeaway"

describe TakeAway do
  MENU = { Thai_green_curry: 9, Aubergine_teriyaki: 9, Mushroom_risotto: 8 }

  let(:menu) { double :menu, :list => MENU }
  let(:order) { double :order, :add => "4 Thai_green_curry added to basket" }
  subject(:takeaway) { described_class.new(menu, order) }

  it "preloads a chosen menu when instantiated" do
    takeaway = TakeAway.new(menu)
    expect(subject.menu).to be menu
  end

  it "has the order feature ready" do
    expect(subject.order).to eq order
  end

  describe "#view_menu" do
    it "shows the menu" do
      formatted_menu = "1. Thai_green_curry -- £9\n2. Aubergine_teriyaki -- £9\n3. Mushroom_risotto -- £8\n"
      allow(menu).to receive(:print_menu).and_return formatted_menu
      expect(subject.view_menu).to eq formatted_menu
    end
  end

  describe "#add" do
    it "add selection to basket" do
      expect(subject.add("Thai_green_curry", 4)).to eq "4 x Thai_green_curry added to basket"
    end
  end

  describe "#review" do
    it "allows customer to review order" do
      subject.add("Thai_green_curry", 4)
      allow(order).to receive(:print_order).and_return "selections"
      expect(subject.review).to eq "selections"
    end
  end

  describe "#checkout" do
    it "raises error if sum entered by customer is incorrect" do
      allow(order).to receive(:sum).and_return 18
      expect{subject.checkout(10)}.to raise_error "Incorrect sum entered"
    end
  end

  describe "#confirmation" do
    it "send sms confirmation to the customer" do

    end

    it "has expected delivery time in the text" do
    end

  end

end
