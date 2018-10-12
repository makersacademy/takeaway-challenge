require "order"

describe Order do

  describe '#initialize' do

    it "should initialize with an empty order array" do
      expect(subject.order).to eq([])
    end

  end

  describe '#add_to_order' do

    it { is_expected.to respond_to(:add_to_order).with(2).arguments }

    it "returns item and quantity" do
      expect(subject.add_to_order("burger", 2)).to eq("Burger x2")
    end

    it "adds item to order" do
      subject.add_to_order("burger", 2)
      expect(subject.order).to eq([["burger", 2]])
    end

  end

end
