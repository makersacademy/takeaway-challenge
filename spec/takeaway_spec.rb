require 'takeaway'

describe Restaurant do

let(:menu) { double(:menu)}

  describe '#menu' do
    it { is_expected.to respond_to :menu }
    it 'print menu' do
      allow(subject).to receive(:menu).and_return(menu)
      expect(subject.menu). to eq(menu)
    end
  end

  describe '#make_order' do
    it { is_expected.to respond_to(:make_order).with(2).arguments }

    it 'should return items to basket' do
      allow(subject).to receive(:basket).and_return(["kebab"])
      subject.make_order("kebab", 1)
      expect(subject.basket).to eq ["kebab"]
    end
  end

  describe "#basket" do
    it { is_expected.to respond_to :basket}

    it "should return empty basket item before order" do
      allow(subject).to receive(:basket).and_return([])
      expect(subject.basket).to eq([])
    end
  end

  describe '#total' do
    it { is_expected.to respond_to :price}
    it 'should return total price of order' do
      subject.make_order("kebab", 1)
      expect(subject.price).to be_integer
    end
  end

  # describe '#complete' do
  #   it { is_expected.to respond_to :complete }
  #   it ''
  # end

end
