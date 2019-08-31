require './lib/menu'

describe Menu do
  include_examples('LineItemListPrinter',
                   "Cafe Latte - 4.30\nCafe Latte - 4.30", 'print_line_items')

  it 'returns immutable items' do
    original_items = subject.items.dup
    new_items = subject.items
    new_items << ''
    expect(subject.items).to eq original_items
  end
end