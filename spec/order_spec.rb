require 'order'

describe Order do
  describe "#show" do
    it { is_expected.to respond_to :show }

    it "shows the order with the items picked" do
      subject.pick("Lasagna", 2)
      subject.pick("Pasta", 1)
      expect(subject.show).to eq([{ "Lasagna" => 2 }, { "Pasta" => 1 }])
    end
  end

  describe "#pick" do
    it { is_expected.to respond_to(:pick).with(2).arguments }

    it "should not let me pick an item not on the menu" do
      expect{ subject.pick("Chili", 2) }.to raise_error("This dish is unavailable")
    end
  end

  describe "#quantity" do
    it { is_expected.to respond_to(:quantity) }

    it 'should give the total bill quantity of each dish' do
      subject.pick("Lasagna", 1)
      subject.pick("Pasta", 2)
      expect(subject.quantity).to eq 3
    end
  end
end
