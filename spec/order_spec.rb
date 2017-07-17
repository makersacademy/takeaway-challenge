require 'order'

describe Order do
  let(:subject) { described_class.new }

  describe '#add' do

    it { is_expected.to respond_to(:add).with(2).argument }

    it 'adds an item(s) to basket' do
      subject.add("spring roll", 1)
      expect(subject.display_basket).to eq "spring roll x1 = £0.99. "
    end
  end

  describe "#display_basket" do
    it { is_expected.to respond_to(:display_basket) }

    it "displays basket" do
      subject.add("spring roll", 1)
      expect(subject.display_basket).to eq "spring roll x1 = £0.99. "
    end
  end

  describe '#total' do
    it { is_expected.to respond_to(:total) }

    it 'calculates the total' do
      subject.add("spring roll", 1)
      expect(subject.display_total).to eq "Total = £0.99"
    end
  end
end
