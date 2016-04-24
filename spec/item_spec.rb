require 'item'

describe Item do

  it 'is initialized with a name and price' do
    item_name = 'baked anchovies'
    item_price = 4.99
    test_class = described_class.new(item_name,item_price)
    expect(test_class.name).to eq item_name
  end

end
