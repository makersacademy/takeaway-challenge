
require'menu'
describe Menu do

  subject(:menu) { described_class.new }
  # let(:menu) {double :menu}

    it 'displays menu list' do
      expect(menu.show_menu).to include(:chips => 2.00)
    end
  end
