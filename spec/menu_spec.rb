require 'menu'

RSpec.describe Menu do
  subject(:menu) { described_class.new }
  describe '#menu' do
    it 'confirms menu is a Hash ' do
      expect(menu.menu).to(be_a(Hash))
    end
  end

  describe '#print_menu' do
    it 'prints the menu dishes and corresponding prices' do
      expect(menu.print_menu).to(have_key("Butter Chicken"))
    end
  end

  describe '#confirm_price' do
    it 'confirms the price of a dish' do
      expect(menu.confirm_price("Butter Chicken")).to(eq(7))
    end
  end
end
