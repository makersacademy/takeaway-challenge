require 'menu_item'

describe MenuItem do

  context 'new item name and price' do
    
    it 'menu item has a name' do
      expect(subject.name).to eq ("American Hot")
    end
  end
end