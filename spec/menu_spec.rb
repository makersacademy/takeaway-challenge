require './lib/menu.rb'

describe Menu do

  let(:menu_items) { [
      double(:menu_item_1, name: 'Test Item 1', description: 'Test item 1 description', price: '10.95'),
      double(:menu_item_2, name: 'Test Item 2', description: 'Test item 2 description', price: '5.99'),
      double(:menu_item_3, name: 'Test Item 3', description: 'Test item 3 description', price: '2.50'),
      double(:menu_item_4, name: 'Test Item 4', description: 'Test item 4 description', price: '12.00')]
  }

  subject(:menu_empty) { described_class.new }
  subject(:menu_dish_1) { described_class.new([menu_items[0]]) }

  context '#initialization' do
    it 'creates a Menu' do
      expect(menu_empty).to be_an_instance_of Menu
    end

    it 'has an empty ObjectList menu_items' do
      expect(menu_empty.menu_items).to be_an_instance_of ItemList::List
    end

    it { is_expected.to respond_to(:menu_items) }

    it { is_expected.to respond_to(:add_item) }

    it { is_expected.to respond_to(:remove_item) }

    it { is_expected.to respond_to(:get_item) }

    it { is_expected.to respond_to(:view_menu) }
  end

  context '#add_item' do

    it 'it adds entry to menu_items' do
      expect { menu_empty.add_item(menu_items[0]) }.to change { menu_empty.menu_items.items }.to [menu_items[0]]
    end

    it 'it returns success' do
      expect(menu_empty.add_item(menu_items[0])).to eq 'Success'
    end
  end

  context '#remove_item' do
    it 'it removes entry from menu_items' do
      menu_empty.add_item(menu_items[0])
      expect { menu_empty.remove_item(menu_items[0]) }.to change { menu_empty.menu_items.items }.to []
    end

    it 'it returns success' do
      expect(menu_empty.add_item(menu_items[0])).to eq 'Success'
    end
  end

  context '#get_item' do
    it 'it finds and returns entry' do
      allow(menu_empty.menu_items).to receive(:find).and_return([menu_items[0]])
      menu_empty.add_item(menu_items[0])
      expect(menu_empty.get_item(menu_items[0])).to eq [menu_items[0]]
    end

    it 'it returns success' do
      expect(menu_empty.add_item(menu_items[0])).to eq 'Success'
    end
  end

  context '#view_menu' do
    subject(:menu_full) { described_class.new }

    before(:each) do
      menu_items.each { |item|
        allow(item).to receive(:[]).and_return("#{item.name}", "#{item.description}", "#{item.price}")
        allow(item).to receive(:keys).and_return(%w(name description price))
        menu_full.add_item(item)
      }

      # [menu_items[0], menu_items[1], menu_items[2], menu_items[3]].each { |item| menu_full.add_item(item) }
    end

    it 'it returns a formatted string' do
      expect(menu_full.view_menu).to eq "1. Test Item 1          Test item 1 description          10.95          \n2. Test Item 2          Test item 2 description          5.99          \n3. Test Item 3          Test item 3 description          2.50          \n4. Test Item 4          Test item 4 description          12.00          "
    end
  end
end
