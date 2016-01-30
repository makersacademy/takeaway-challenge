require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  
  describe '#show' do
    it 'returns a menu' do
      expect(menu.show).to eq ({ ribs: 3,
        beef: 4,
        rolls: 3,
        chips: 2,
        pies: 5})
    end
  end
end