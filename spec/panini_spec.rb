require 'panini'

describe Menu do

  subject(:menu) { described_class.new }
  describe '#display_menu' do

    it 'shows the element of the menu' do
      expect(subject.display_menu).to eq Menu::PANINI
    end

  end
end
