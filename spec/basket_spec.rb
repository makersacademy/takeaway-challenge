require 'basket'

describe Basket do
  let(:itemA) { double("itemA", :name => "Egg fried rice", :price => 4.99) }
  
  describe '#add_item' do
    it "adds items to the basket" do
      expect { subject.add_item(itemA) }.to change { subject.contents.count }.by(1)
    end
  end

  describe '#review_contents' do
    it "gives a summary of the order" do
      5.times { subject.add_item(itemA) }
      expect(subject.review_contents).to eq "x5 Egg fried rice: £24.95
TOTAL: £24.95"
    end
  end

  describe '#empty?' do
    it 'returns true when there are no items in @contents' do
      expect(subject.empty?).to be true
    end
    it 'returns false when there are item(s) in @contents' do
      subject.add_item(itemA)
      expect(subject.empty?).to be false
    end
  end
end
