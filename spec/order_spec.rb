require 'order'

describe Order do

  describe '#list_menu' do
    it 'lists the menu' do
      expect(subject.list_menu).to eq 'food list'
    end
  end

end
