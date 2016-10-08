require 'order'

describe Order do
  let(:menu) { double :menu, :list => { Thai_green_curry: 9, Aubergine_teriyaki: 9, Mushroom_risotto: 8 } }
  subject (:order) { described_class.new(menu) }


  VEGETARIAN_MENU = { Thai_green_curry: 9, Aubergine_teriyaki: 9, Mushroom_risotto: 8 }

  describe "initialize" do
    it "selection is empty by default" do
      expect(subject.basket).to be_empty
    end

    it "has preloaded menu - dish and price" do
      expect(subject.menu).to eq VEGETARIAN_MENU
    end
  end


  describe "#add" do
    it "allows customer to select item and quantity" do
      expect(subject).to respond_to(:add).with(2).argument
    end

    it "stores selection" do
      sample_selection = { Thai_green_curry: 4 }
      subject.add("Thai_green_curry", 4)
      expect(subject.basket).to eq sample_selection
    end
  end

  describe "#print_order" do
    it "prints order summary for review" do
      order_summary = "Thai_green_curry x 1 = £9\nTotal sum = £9\n"
      allow(subject).to receive(:basket).and_return({Thai_green_curry: 1})
      expect{subject.print_order}.to output(order_summary).to_stdout
    end
  end

end
