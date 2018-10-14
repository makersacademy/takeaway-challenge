require 'order'

describe Order do
  let(:menu) { double :menu }
  subject { described_class.new(menu: menu) }

  before {
    subject.add("Half Chicken", 2)
  }

  describe "#add" do
    it "should add several dishes to the current order" do
      expect(subject.current).to eq "Your current order:\n2 x Half Chicken"
    end
  end

  describe "#total" do
    it "should call dishes on Menu obejct" do
      expect(menu).to receive_message_chain(:dishes, :[], :*)
      subject.total
    end

    it "should return the total cost of the order" do
      allow(menu).to receive_message_chain(:dishes, :[], :*).and_return(16)
      expect(subject.total).to eq 16
    end
  end
end
