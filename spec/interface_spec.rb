require 'interface'

describe Interface do
  let(:order) { double :order }
  let(:menu) { double :menu }
  let(:number) { double :number }
  it 'chooses an option from the menu 2 args' do
    expect(subject).to respond_to(:get).with(2).arguments
  end

  it 'shows total for order' do
    new = Interface.new(menu, order)
    allow(order).to receive(:total).and_return(10)
    expect(new.show_total).to eq(10)
  end

  it 'shows current order' do
    new = Interface.new(menu, order)
    allow(order).to receive(:show).and_return("current order")
    expect(new.show_order).to eq("current order")
  end

  it { is_expected.to respond_to(:checkout).with(2).arguments }

  it 'raises an error if the amount of money do not match the total' do
    new = Interface.new(menu, order)
    allow(order).to receive(:total).and_return(11)
    expect { new.checkout(10, number) }.to raise_error("sums don't match!")
  end
end
