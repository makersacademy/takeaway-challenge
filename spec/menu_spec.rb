require 'menu'

describe Menu do
  subject { described_class.new([{ item: :item, price: :price }]) }
  it { is_expected.to respond_to(:dishes) }

  describe '#default_menu' do
    it 'is an array' do
      expect(subject.default_menu).to be_an(Array)
    end
  end

  describe '#initialize' do
    it 'initializes with a default_menu' do
      expect(subject.dishes).to include({ item: :item, price: :price })
    end
  end

  describe '#print_menu' do
    it 'shows items on the default_menu' do
      expect(subject.print_menu).to eq ["1. item, £price"]
    end
  end

end
