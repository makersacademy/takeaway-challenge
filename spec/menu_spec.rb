require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  context 'menu' do
    it 'is shows the menu of available items' do
      expect(menu).to respond_to(:view)
    end
  end
end
