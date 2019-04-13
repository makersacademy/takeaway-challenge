require 'menu'

describe Menu do
  describe '#menu' do
    it 'contains a menu' do
        expect(subject.menu).to eq(menu_list)
    end
  end
end
