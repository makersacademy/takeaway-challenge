require './lib/menu'

describe Menu do
  include_examples('LineItemListPrinter',
                   "Cafe Latte - 4.30\nCafe Latte - 4.30", 'line_items_string')

  subject { described_class.new([menu_item, menu_item]) }

  it 'returns immutable items' do
    original_items = subject.items.dup
    subject.items << ''
    expect(subject.items).to eq original_items
  end

  it 'retrieves items at indicies' do
    expect(Menu.new(%w(1 2 3)).items_at([0, 2])).to eq %w(1 3)
  end

  it 'fails silently when retrieving non-existing items' do
    expect { subject.items_at([300]) }.not_to raise_error
  end
end