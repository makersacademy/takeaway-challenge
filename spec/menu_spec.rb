require 'menu'

describe Menu do

  subject { described_class.new(dishes) }
  let(:dishes) { {burger: 7, hamburger: 7, chips: 2} }
  let(:menu) {"burger = £7, hamburger = £7, chips = £2"}



  it { is_expected.to respond_to(:see_menu) }
  it { is_expected.to respond_to(:dishes) }

  context 'on initalization' do
    it 'it has menu with dishes and prices' do
      expect(subject.dishes).to eq(dishes)
    end
  end

  describe '#see_menu' do
    it 'shows the menu' do
      expect(subject.see_menu).to eq(menu)
    end
  end
end
