require 'items_array_printer'

describe ItemsArrayPrinter do
  describe '#to_string' do
    before(:each) do
      @item_printer = double('item_printer_module')
      @item_array = [double('item1'), double('item2')]
    end
    it 'sends each item to the item_printer_module' do
      expect(@item_printer).to receive(:to_string).with(@item_array[0])
      expect(@item_printer).to receive(:to_string).with(@item_array[1])
      subject.to_string(@item_array, @item_printer)
    end
    it 'separates ItemPrinter output onto separate lines' do
      allow(@item_printer).to receive(:to_string).and_return("menu item")

      expect(subject.to_string(@item_array, @item_printer)).to eq("menu item\nmenu item")
    end
  end
end
