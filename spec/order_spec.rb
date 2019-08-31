require './lib/order'

describe Order do
  include_examples('LineItemListPrinter',
                   "Cafe Latte - 4.30\nCafe Latte - 4.30\nTotal: 8.60", 'to_string')

  let(:menu_item) { instance_double('Takeaway::MenuItem', price: '4.30', to_string: 'Cafe Latte - 4.30') }
  subject         { described_class.new([menu_item, menu_item]) }

  it 'has expected order total' do
    expect(subject.total).to eq '8.60'
  end
end