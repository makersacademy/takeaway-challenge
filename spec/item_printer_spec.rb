require 'item_printer'

describe ItemPrinter do
  it 'turns item object into a string' do
    @item_mock = double('item', name: 'cake', price: 6.00)
    expect(subject.to_string(@item_mock)).to eq 'cake - £6.00'
  end
end
