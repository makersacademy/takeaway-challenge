require 'order'

describe Order do
  it 'adding a dish to the order shows that dish in the order basket' do
    subject.add(1)
    expect(subject.basket).to eq "Your order:\n1x Pie (£6) - £6\nTotal: £6"
  end

  it 'adding a two dishes to the order shows both dishes in the order basket' do
    subject.add(1)
    subject.add(2)
    expect(subject.basket).to eq "Your order:\n1x Pie (£6) - £6\n1x Mash (£4) - £4\nTotal: £10"
  end
end