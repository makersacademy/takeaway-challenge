require 'menu'

describe Menu do
  subject { described_class.new([{ item: :item, price: :price }]) }
  it { is_expected.to respond_to(:dishes) }
  it { is_expected.to respond_to}

  describe '#print_menu' do
    it 'shows items on the default_menu' do
      expect(subject.print_menu).to eq ["1. item, £price"]
    end
  end

end
