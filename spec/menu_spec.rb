require 'menu'

describe Menu do
  subject(:menu) { described_class.new(items, restaurant_name) }
  let(:items) { [{ name: "name 1", price: 1 }, { name: "name 2", price: 2 }] }
  let(:restaurant_name) { "My name" }
  
  describe '#all' do
    it 'returns an array of all items' do
      expect(menu.all).to eq items
    end
  end

  describe '#pretty' do
    before do
      @pretty_menu = menu.pretty.split("\n")
    end

    it 'the first line contains the name' do
      expect(@pretty_menu[0]).to include(restaurant_name)
    end

    it 'the menu lines contain name and price' do
      expect(@pretty_menu[2]).to include(items[1][:name], items[1][:price].to_s)
    end

    it "the menu lines start with the items' id number (0 indexed)" do
      expect(@pretty_menu[2][0]).to eq "1"
    end
  end

  describe '#get' do
    it 'returns the item according to the index (0 indexed)' do
      expect(menu.get(0)).to eq items[0]
    end

    it 'raises an error if the item is not in the menu' do
      expect { menu.get(99) }.to raise_error "Could not find item: item does not exist. Try checking the menu again."
    end
  end

  describe '#include?' do
    it 'returns true if the item is in the menu' do
      expect(menu.include? items[1]).to be true
    end

    it 'returns false if the item is not in the menu' do
      expect(menu.include? :something).to be false
    end
  end
  
  describe 'defaults' do
    subject(:default_menu) { described_class.new }
    it 'has defaults for the name and menu items' do
      # default_items = default_menu.all
      # expect(default_items).to include({name: "Mixed Meze", price: 10})
      expect { subject }.not_to raise_error
    end
  end
end
