require './lib/order'

describe Order do
  include_examples('LineItemListPrinter',
                   "Cafe Latte - 4.30\nCafe Latte - 4.30\nTotal: 8.60", 'to_string')

  it 'has expected order total' do
    expect(subject.total).to eq '8.60'
  end
end