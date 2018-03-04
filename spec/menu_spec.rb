require_relative '../lib/menu.rb'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#initialize' do
    it 'is populated with a set of dishes' do
      expect(menu.dishes).to be_a(Hash)
    end
  end

  describe '#show_menu' do
    it 'prints out the menu' do
      expect(menu.show_menu).to eq(menu.dishes)
    end
  end

end
