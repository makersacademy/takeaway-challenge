require "takeaway"
describe TakeAway do
  it { is_expected.to respond_to :menu }
  it { is_expected.to respond_to :order }
  it { is_expected.to respond_to :summary }
  context "has a menu" do
    it { is_expected.to respond_to { } }
  end
  context "has a empty basket" do
    it { is_expected.to respond_to { } }
  end

  describe "#menu" do
    it "contains meals" do
      expect(subject.menu).not_to be_empty
    end
  end
  describe "#order" do
    it { is_expected.to respond_to(:order).with(1).argument }
  end
  describe "#summary" do
    let(:order) { describe_class.new }
    order.order("spring roll")
    order.order("char sui bun")
    it "shows total" do
      expect(processor.process("foo", validator)).to eq("foo processed")
    end
  end
end
