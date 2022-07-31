require 'menu'

describe Menu do
  let(:itemA) { double("itemA", :name => "Egg fried rice", :price => 4.99) }
  let(:itemB) { double("itemB", :name => "Steamed rice", :price => 4.49) }
  let(:itemC) { double("itemC", :name => "Sesame prawn toast", :price => 7.99) }
  let(:new_menu) { Menu.new([itemA, itemB, itemC]) }

  it 'calling items provides a full list of items' do
    expect(subject.items).to eq Menu::DEFAULT_ITEMS
  end

  describe '#review_menu' do
    it 'returns a list of menu items in the correct format' do
      expect(new_menu.review_menu).to eq "1. Egg fried rice, £4.99
2. Steamed rice, £4.49
3. Sesame prawn toast, £7.99"
    end
  end

  describe '#valid_choice?' do
    it 'returns true only if the chosen option appear is viable' do
      expect(new_menu.valid_choice?(0)).to eq false
      expect(new_menu.valid_choice?(1)).to eq true
      expect(new_menu.valid_choice?(3)).to eq true
      expect(new_menu.valid_choice?(4)).to eq false
    end
  end

  describe '#fetch item' do
    it 'returns the chosen item' do
      expect(new_menu.fetch_item(2)).to eq itemB
    end
  end
  
end
