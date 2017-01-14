require 'menu'

describe Menu do
  context 'ALL' do
    it 'has a list of all dishes' do
      expect(Menu::ALL).not_to be_nil
    end
    it 'has a price for each dish' do
      expect(Menu::ALL.values.all? { |value| value.is_a? Float }).to eq true
    end
  end
end
