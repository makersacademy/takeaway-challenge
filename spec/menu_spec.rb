require './lib/menu.rb'

describe Menu do
  before(:each) do
    subject.add("Pizza", 5)
  end

  it { is_expected.to be_instance_of(described_class) }

  it { is_expected.to respond_to(:dishes) }

  describe '#add' do
    it 'should add item to the menu attribute dishes' do
      expect(subject.dishes).to include("Pizza" => 5)
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

  describe '#price' do
    it 'should return the price' do
      expect(subject.price("Pizza")).to eq(5)
    end
  end
end
