require 'menu'

describe Menu do
  subject { described_class.new }
  let(:dishes) { {'Fish & Chips' => 4, 'Burger' => 3, 'Shawarma' => 5} }

  it { is_expected.to respond_to(:print_menu) }

  it 'stores a menu of dishes and prices' do
    expect(subject.menu).to eq dishes
  end

  describe '#print_menu' do
    it 'returns the menu' do
      expect(subject.print_menu).to eq 'Fish & Chips £4, Burger £3, Shawarma £5'
    end
  end

end
