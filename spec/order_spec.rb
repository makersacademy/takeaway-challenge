require 'order'

describe Order do
  let(:pie) { double(:pie) }

  it 'adding a dish to the order shows that dish in the order basket' do
    subject.add(pie)
    expect(subject.basket).to eq "Your order:\n1x Pie (£6) - £6\nTotal: £6"
  end
end