require 'menu'

describe Menu do
  subject(:menu) { described_class.new('menu.yaml') }
  let(:dishes) { {:onion_bhaji=>2.95, :chicken_tikka_masala=>7.95, :naan=>1.95} }

  describe '#display_menu' do
    it 'displays menu' do
      expect(menu.display_menu).to eq dishes
    end
  end

  describe '#has_dish?' do
    it 'returns true if menu has a dish' do
      expect(menu).to have_dish(:naan)
    end

    it 'returns false if menu does not have a dish' do
      expect(menu).not_to have_dish(:bouillabaisse)
    end
  end
end