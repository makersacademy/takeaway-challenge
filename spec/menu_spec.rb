require 'menu'

describe Menu do

  let(:menu) { described_class.new(items) }
  let(:items) do
    { falafel: 3, houmous: 1 }
  end
  let(:printed_menu) { "Falafel: £3.00, Houmous: £1.00" }

  it 'contains a list of dishes and prices' do
    expect(menu.items).to eq items
  end

  it 'can print a list of dishes and prices' do
    expect(menu.print).to eq printed_menu
  end

  it 'can tell if a dish is not on the menu' do
    expect(menu.contains?(:chicken)).to be false
  end

  it 'can tell the price of a dish' do
    expect(menu.price(:falafel)).to eq 3
  end

end
