require 'menu'

describe Menu do

before (:each) do
  @item_class = double('Item')
  @menu = Menu.new(@item_class)
end
  describe '#add_item' do
     it 'can add item object to items array' do
       @item = double('item', name: self)
       allow(@item_class).to receive(:new).with('cake', 6).and_return @item
       @menu.add_item('cake', 6)
       expect(@menu.get('cake')).to eq([@item])
     end
  end



end
