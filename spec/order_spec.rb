require 'order'

describe Order do
  let(:menu_raw) { Menu.new }

  it 'lets the customer select a number of available dishes' do
    menu = menu_raw.parse_file
    expect(subject.select(0, menu)).to eq([{name: 'item1', cost: 1.0}])
  end

  it 'adds a number of dishes to order' do
    menu = menu_raw.parse_file
    subject.select(0, menu)
    subject.select(1, menu)
    expect(subject.pad).to eq([{name: 'item1', cost: 1.0}, {name: 'item2', cost: 2.0}])
  end
end