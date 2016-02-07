require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:default_menu) { {ribs: 3,
                        beef: 4,
                        rolls: 3,
                        chips: 2,
                        pies: 5}
  }

  describe '#show' do
    it 'returns a menu' do
      expect(menu.show).to eq default_menu
    end
  end
end