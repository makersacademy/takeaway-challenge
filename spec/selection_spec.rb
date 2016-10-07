require 'selection'

describe Selection do
  let(:menu) { double :menu, :list => { Thai_green_curry: 9, Aubergine_teriyaki: 9, Mushroom_risotto: 8 } }
  subject (:selection) { described_class.new(menu) }


  VEGETARIAN_MENU = { Thai_green_curry: 9, Aubergine_teriyaki: 9, Mushroom_risotto: 8 }

  describe "initialize" do
    it "can store quantity of selected item" do
      expect(subject.quantity).to eq []
    end

    it "has preloaded menu - dish and price" do
      expect(subject.menu).to eq VEGETARIAN_MENU
    end

    it "has an a list of dishes for selection" do
      expect(subject.dishes).to eq ["Thai_green_curry", "Aubergine_teriyaki", "Mushroom_risotto"]
    end
  end


  describe "#select" do
    it "allows customer to specify quantity on an item" do
      subject.select
      allow(STDIN).to receive(:gets).and_return 1
      expect(subject.quantity).to include 1
    end
  end

end
