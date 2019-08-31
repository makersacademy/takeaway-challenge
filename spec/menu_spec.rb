require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  context '#initialize' do
    it 'contains a list of dishes and prices' do
      expect(menu.dishes).to eq described_class::DISHES
    end
  end

  context '#open' do
    it 'opens the menu' do
      expect(menu.open).not_to be_empty
    end
  end
end
