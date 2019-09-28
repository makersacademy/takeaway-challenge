require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#list' do

    it 'confirms list is a hash' do
      expect(menu.list.class).to be Hash
    end
  end

  describe '#print_menu' do

    it 'displays a list of dishes' do
      expect(menu.print_menu).to eq menu.list
    end
  end
end
