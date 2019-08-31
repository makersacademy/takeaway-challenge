require './lib/menu'

describe Menu do
  include_examples('LineItemListPrinter',
                   "Cafe Latte - 4.30\nCafe Latte - 4.30", 'line_items_string')

  it 'returns immutable items' do
    original_items = subject.items.dup
    subject.items << ''
    expect(subject.items).to eq original_items
  end

  it 'retrieves items at indicies' do
    first = MenuItem.new('1', '2')
    second = MenuItem.new('3', '4')
    third = MenuItem.new('5', '6')
    menu = Menu.new([first, second, third])

    expect(menu.items_at([0, 2])).to eq [first, third]
  end
end