require 'order'

describe Order do

  describe '#show_menu' do
    it 'displays a menu with prices' do
      expect(subject.show_menu).to be_a_kind_of(Hash)
    end
  end

end