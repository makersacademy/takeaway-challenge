require "takeaway"
describe TakeAway do
  let(:neworder) { TakeAway.new }
  it { is_expected.to respond_to :menu }
  # it { is_expected.to respond_to :add2_basket }
  it { is_expected.to respond_to :summary }
  context "has a menu" do
    it { is_expected.to respond_to { } }
  end
  context "has a empty basket" do
    it { is_expected.to respond_to { } }
  end

  describe "#menu" do
    it "contains items" do
      expect(subject.menu).not_to be_empty
    end
    it "shows items" do
      expect(subject.menu).not_to be_empty
    end
  end
  describe "#add" do
    it { is_expected.to respond_to(:add).with(1).argument }
    context "empty query" do
      it "meal not found" do
        expect { neworder.add("") }.to raise_error described_class::Error[0]
      end
    end
  end
  describe "#summary" do
    it "shows empty basket" do
      expect { neworder.summary(0) }.to raise_error described_class::Error[2]
    end
    before do
      neworder.add("Spring roll")
      neworder.add("Char sui bun")
    end

    it "shows total" do
      expect(neworder.summary).to eq 4.98
    end
  end
end
