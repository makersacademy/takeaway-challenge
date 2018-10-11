require 'restaurant'

describe Restaurant do

  let(:takeaway_order) { double :takeaway_order }
  let(:menu) { double :menu }
  subject { described_class.new(menu) }

  context "calculating the bill" do
    it "calculates the bill of the user's basket" do
      allow(takeaway_order).to receive(:basket) { { "fish" => 2 } }
      allow(menu).to receive(:display) { { "fish" => 10 } }
      expect(subject.bill(takeaway_order.basket)).to eq 20
    end

    it "should ignore items not on the menu" do
      allow(takeaway_order).to receive(:basket) { { "fish" => 2, "lol" => 1 } }
      allow(menu).to receive(:display) { { "fish" => 10 } }
      expect(subject.bill(takeaway_order.basket)).to eq 20
    end
  end

end
