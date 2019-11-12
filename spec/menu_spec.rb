require './lib/menu.rb'

describe Menu do
  it { is_expected.to be_instance_of(described_class) }

  it { is_expected.to respond_to(:dishes) }

  describe '#add' do
    let(:dish) {double :dish}
    let(:price) {double :price}
    it 'should add item to the menu attribute dishes' do
      subject.add(dish, price)
      expect(subject.dishes.key?(dish)).to eq(true)
    end
  end

  describe '#has?' do
    it 'should return true when item is present' do
      expect(subject.has?("Pizza")).to eq(true)
    end

    it 'should return false when item is not present' do
      expect(subject.has?("Beans")).to eq(false)
    end
  end
end
