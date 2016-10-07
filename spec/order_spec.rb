require "order"

describe Order do
  VEGETARIAN_MENU = { Thai_green_curry: 9, Aubergine_teriyaki: 9, Mushroom_risotto: 8 }

  let(:menu) { double :menu, :list => VEGETARIAN_MENU }
  let(:selection) { double :select => "selection" }
  subject(:order) { described_class.new(menu) }

  it "preloads a chosen menu when instantiated" do
    order = Order.new(menu)
    expect(subject.menu).to be menu
  end

  describe "#view_menu" do
    it "shows the menu" do
      allow(menu).to receive(:list).and_return VEGETARIAN_MENU
      expect(subject.view_menu).to eq VEGETARIAN_MENU
    end
  end

  describe "#select_items" do
    it "starts a selection process" do
      dishes = ["Thai_green_curry", "Aubergine_teriyaki", "Mushroom_risotto"]
      expect(subject.select_items).to eq dishes
    end
  end

end
