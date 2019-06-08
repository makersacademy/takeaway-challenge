require 'menu'

describe Menu do

  before(:each) do
    @item_class = double('Item')
    @menu = Menu.new(@item_class)
  end
  describe '#add_item' do
    it 'calls to add new item object' do
      @item = double('item', name: self)
      expect(@item_class).to receive(:new).with('cake', 6).and_return @item
      @menu.add_item('cake', 6)
    end
  end
  describe '#print_menu' do
    it 'calls .to_string on printer module' do
      printer_mock = double("ItemsArrayPrinter")
      expect(printer_mock).to receive(:to_string).with(Array).and_return String
      @menu.print_menu(printer_mock)
    end
    # it 'return items in item array' do
    #   @item1 = double('item1', name: 'cake', price: 6)
    #   allow(@item_class).to receive(:new).with('cake', 6).and_return @item1
    #   @menu.add_item('cake', 6)
    #   @item2 = double('item2', name: 'toastie', price: 12)
    #   allow(@item_class).to receive(:new).with('toastie', 12).and_return @item2
    #   @menu.add_item('toastie', 12)
    #   expect(@menu.print_menu).to eq("cake - 6\ntoastie - 12")
    # end

  end


end
