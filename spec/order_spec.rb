require 'order'

describe Order do

  describe '#show_menu' do
    it 'displays a menu with prices' do
      expect(subject.show_menu).to eq Hash
    end
  end
  
end