require 'menu'

describe Menu do
  it 'print a list of menu items' do
    expect { subject.print }.to output("Nan: £2.20\nRice: £2.70\nAloo Gobi: £4.10\nSag Paneer: £4.30\nDaal Makhani: £6.10\n").to_stdout
  end

  it 'returns a list of menu items' do
    expect(subject.print).to eq Menu::ITEMS
  end
end
