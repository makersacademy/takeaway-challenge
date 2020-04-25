require 'menu'

describe Menu do
  subject { described_class.new }
  let(:dishes) { { 'Fish & Chips' => 4, 'Burger' => 3, 'Shawarma' => 5 } }

  it { is_expected.to respond_to(:print_menu) }
  it { is_expected.to respond_to(:add_dish_to_menu).with(2).arguments }

  it 'stores a menu of dishes and prices' do
    expect(subject.menu_list).to eq dishes
  end

  describe '#print_menu' do
    it 'returns the menu' do
      expect(subject.print_menu).to eq 'Fish & Chips £4, Burger £3, Shawarma £5'
    end
  end

  describe '#add_dish_to_menu' do
    it 'adds a new dish to menu' do
      expect {subject.add_dish_to_menu('Mititei', 1) }
      .to change { subject.menu_list }.to include({ 'Mititei' => 1 })
    end
  end
end
