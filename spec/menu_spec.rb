require 'menu'

describe Menu do
  let(:dishes) { double :dishes, { "Hummus": 5 } }
  subject(:menu) { described_class.new(dishes) }
  before { allow(dishes).to receive(:[]).with('Hummus').and_return(5) }
  before { allow(dishes).to receive(:[]).with('Pizza').and_return(nil) }

  it 'stores hash of dishes' do
    expect(subject.all).to eq dishes
  end

  describe '#price' do
    it 'returns price of item' do
      expect(subject.price('Hummus')).to eq 5
    end
  end

  describe '#available?' do
    it 'returns true if item exists' do
      expect(subject.available?('Hummus')).to eq true
    end

    it 'returns false if item does not exist' do
      expect(subject.available?('Pizza')).to eq false
    end
  end
end
