require 'menu'

describe Menu do

  context 'on initalization' do
    it { is_expected.to respond_to(:dishes) }

    it 'dishes equals menu' do
      expect(subject.dishes).to eq described_class::MENU
    end
  end

  describe '#view_menu' do
    let(:menu) { "Beef Burger = £7, Double Cheese Burger = £9, Hamburger = £7, Fish Taco = £6, Hot Dog = £5, Chips = £1.5" }
    it { is_expected.to respond_to(:view_menu) }
    it 'shows the menu' do
      expect(subject.view_menu).to eq(menu)
    end
  end
end
