require 'order'

describe Order do
  let(:menu_raw) { Menu.new }

  it 'lets the customer select a number of available dishes' do
    menu = menu_raw.parse_file
    subject.select(0, menu, 1)
    expect(subject.pad).to eq([{ name: 'item1', cost: 1.0, amount: 1 }])
  end

  it 'adds a number of dishes to order' do
    menu = menu_raw.parse_file
    subject.select(0, menu, 1)
    subject.select(1, menu, 1)
    expect(subject.pad).to eq([{ name: 'item1', cost: 1.0, amount: 1 }, { name: 'item2', cost: 2.0, amount: 1 }])
  end
end
