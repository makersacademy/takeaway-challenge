require 'item'

describe Item do
  before(:each) do
    @item = Item.new('cake', 6)
  end
  describe '#intialize' do
    it 'initializes with a name' do
      expect(@item.name).to eq 'cake'
    end
    it 'initializes with a price' do
      expect(@item.price).to eq 6
    end
  end
end
