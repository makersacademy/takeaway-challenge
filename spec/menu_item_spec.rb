require 'menu_item'

describe MenuItem do
  let(:name) { double :name }
  let(:price) { double :price }
  subject(:menu_item) { described_class.new(name, price) }

  it "contains a menu item's @name and @price" do
    new_item = described_class.new('favourite', 5)
    expect(new_item.name).to eq('favourite')
    expect(new_item.price).to eq(5) 
  end

  describe '#format_item' do
    it 'returns the menu item as a string' do
      new_item = described_class.new('favourite', 5)
      expect(new_item.format_item).to eq("favourite: £5.00")  
    end
  end

end
