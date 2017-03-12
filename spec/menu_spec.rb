require 'menu'

describe Menu do
  context 'ALL_DISHES' do
    it 'has a list of all dishes' do
      expect(Menu::ALL_DISHES).not_to be_nil
    end
    it 'has a price for each dish' do
      expect(Menu::ALL_DISHES.values.all? { |value| value.is_a? Float }).to eq true
    end
  end
end
