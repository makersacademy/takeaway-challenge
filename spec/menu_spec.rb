require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#list' do
    it 'portrays the list of options, with price' do
      expect(menu.list).to eq({ bean_burger: 8, vegan_cheese_platter: 6, jack_fruit_burger: 8, breaded_aubergine: 7 })
    end
  end
end
