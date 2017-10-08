require './lib/item_list'

describe ItemList do
  let(:item) { double(:item1) }

  let(:item_1) { double :item_1, name: 'Test Item 1', description: 'Test item 1 description', price: 10.95 }
  let(:item_2) { double :item_2, name: 'Test Item 2', description: 'Test item 2 description', price: 5.99 }
  let(:item_3) { double :item_3, name: 'Test Item 3', description: 'Test item 3 description', price: 2.50 }
  let(:item_4) { double :item_4, name: 'Test Item 4', description: 'Test item 4 description', price: 12.00 }

  subject(:list_empty) { described_class.new([]) }
  subject(:list_item_1) { described_class.new([item_1]) }

  describe '#initialize' do
    it 'creates a list with no items' do
      expect(list_empty.get(0)).to be_nil
    end
  end

  context '#add' do
    it 'should add a item to items array' do
      expect { list_empty.add item_1 }.to change { list_empty.items }.by [item_1]
    end

    context 'raise_error' do
      it 'should raise_error if item already in list' do
        expect { list_item_1.add(item_1) }.to raise_error 'Already exists in list'
      end
    end
  end

  context '#remove' do
    it 'should remove a item from the items array' do
      list_item_1.remove(item_1)
      expect(list_item_1.items).not_to include item_1
    end

    context 'raise_error' do
      it 'should raise_error if item not found' do
        expect { list_empty.remove(item_1) }.to raise_error 'Not found in list'
      end
    end
  end

  describe 'showing items as a string' do
    let(:item_list_printer_module) { double(:item_list_printer_module) }

    it 'passes all items as printer and returns result' do
      list_empty.add(item_1)
      list_empty.add(item_2)
      list_empty.add(item_3)
      items = [item_1, item_2, item_3]

      expect(item_list_printer_module)
          .to receive(:to_string).with(items)

      list_empty.to_string(item_list_printer_module)
    end
  end

  describe 'get item' do
    it 'gets item at index' do
      list_empty.add([item_1])
      expect(list_empty.get(0)).to_not be_nil
    end
  end
end
