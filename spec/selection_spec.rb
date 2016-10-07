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

  describe "#quantity" do
    it "stores required quantity for all items" do
      subject.select
      # Enter 1, 2, 3 into command line when prompted for quantity
      expect(subject.quantity).to eq [1,2,3]
    end
  end

  describe "#review" do
    it { is_expected.to respond_to :review }

    xit "gets total sum from the private sum method" do
      allow(subject).to receive(:quantity).and_return [1,1,0]
      expect(subject.review).to include 18
    end

    it "prints order summary for review", :focus do
      order_summary = "Thai_green_curry @ £9 | 1 unit | £9\nAubergine_teriyaki @ £9 | 0 unit | £0\nMushroom_risotto @ £8 | 0 unit | £0\nTotal sum = £9\n" 
      allow(subject).to receive(:quantity).and_return [1,0,0]
      expect{subject.review}.to output(order_summary).to_stdout
    end

    it "raises error if customer thinks the sum is incorrect" do

    end
  end

end
