require './lib/item_list_printer'

describe ItemListPrinter do
  describe 'printing a list of items' do
    let(:item_printer_module) { double(:item_printer_module) }
    let(:items) { [double(:item1), double(:item2)] }

    it 'sends each item to the item_printer' do
      expect(item_printer_module)
          .to receive(:to_string).with(items[0], 1)
      expect(item_printer_module)
          .to receive(:to_string).with(items[1], 2)

      described_class.to_string(items, item_printer_module)
    end

    it 'separates item_printer output onto separate lines' do
      allow(item_printer_module)
          .to receive(:to_string).and_return('a item')

      expect(described_class.to_string(items, item_printer_module))
          .to eq("a item\na item")
    end
  end
end
