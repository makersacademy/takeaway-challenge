require 'menu'

describe Menu do

  before(:each) do
    @item_class = double('Item')
    @menu = Menu.new(@item_class)
  end
  describe '#add_item' do
    it 'can add item object' do
      @item = double('item', name: self)
      expect(@item_class).to receive(:new).with('cake', 6).and_return @item
      @menu.add_item('cake', 6)
    end
  end

end
