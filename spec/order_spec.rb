require "order"

describe Order do
  MENU = { Thai_green_curry: 9, Aubergine_teriyaki: 9, Mushroom_risotto: 8 }

  let(:menu) { double :menu, :list => MENU }
  let(:selection) { double :select => "selection" }
  subject(:order) { described_class.new(menu) }

  it "preloads a chosen menu when instantiated" do
    order = Order.new(menu)
    expect(subject.menu).to be menu
  end

  describe "#view_menu" do
    it "shows the menu" do
      formatted_menu = "1. Thai_green_curry -- £9\n2. Aubergine_teriyaki -- £9\n3. Mushroom_risotto -- £8\n"
      allow(menu).to receive(:print_menu).and_return formatted_menu
      expect(subject.view_menu).to eq formatted_menu
    end
  end

  describe "#select_items" do
    it "starts a selection process by instantiating a selection" do
      subject.select_items(selection)
      expect(subject.selection).to eq selection
    end
  end

  describe "#review" do
    it "creates a review process by starting calling review function" do
      subject.select_items(selection)
      allow(selection).to receive(:review).and_return 3
      subject.review
      expect(subject.review).to eq 3
    end
  end

end
