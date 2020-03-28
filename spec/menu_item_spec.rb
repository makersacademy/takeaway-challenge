require 'menu_item'

describe MenuItem do

  subject { MenuItem.new("American Hot", 8.99) }

  context 'new item name and price' do
    
    it 'menu item has a name' do
      expect(subject.name).to eq "American Hot"
    end

    it 'menu item has a price' do
      expect(subject.price).to eq 8.99
    end
  end
end
