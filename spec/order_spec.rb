require 'order'

describe Order do
  let(:subject) { Order.new(menu)}
  let(:item) { { chicken: 2} }
  let(:order) { { chicken: 2, chips: 1 } }
  let(:menu) { double(:menu) }

  before do
    allow(menu).to receive(:item_included?).with(:chicken).and_return(:true)
    allow(menu).to receive(:item_included?).with(:pizza).and_return(:true)
    allow(menu).to receive(:item_included?).with(:chips).and_return(:true)
    allow(menu).to receive(:item_included?).with(:fish).and_return(:false)
  end

  describe "#add" do

    it "allows adding a new item and quantity to an order" do
      subject.add(:chicken, 2)
      expect(subject.order).to eq item
    end

    it "raises an error when item not included in menu" do
      expect{ subject.add(:fish, 1) }.to raise_error "Error item not available"
    end
  end
  
  describe "#order" do
    it "stores the order" do
      subject.add(:chicken, 2)
      # subject.add(:chips, 1 )
      expect(subject.add(:chips, 1)).to eq order
    end
  end

  describe "#total" do
    before do
      allow(menu).to receive(:price).with(:chicken).and_return(6)
      allow(menu).to receive(:price).with(:pizza).and_return(10)
      allow(menu).to receive(:price).with(:chips).and_return(4)
    end
    it "works out a total for the order" do
    subject.add(:chicken, 2)
    subject.add(:chips, 1)
    expect(subject.total).to eq 16
    end
  end
end