require 'item_string'
describe ItemString do
  let(:name) { double(:name)}
  let(:price) { double(:price) }
  let(:quantity) { double(:quantity) }
  let(:total) { double :total }
  let(:item) { double(Item.new(name, price, quantity), :total => total, :name => name, :quantity => quantity) }

  it 'returns a string when passed an item' do
    expect(described_class.str(item)).to eq("#{name} x #{quantity} = #{total}")
  end
end
