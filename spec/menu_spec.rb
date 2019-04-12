require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#view_menu' do
    it 'return list of dishes and prices' do
      expect(menu.view_menu).to eq menu.view_menu
    end
  end
end
