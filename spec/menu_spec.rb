require 'menu'

describe Menu do
  let(:menu) {described_class.new}

  context '#access' do
    it 'returns the menu hash' do
      expect(menu.access).to be_a_kind_of(Hash)
    end
  end
end
