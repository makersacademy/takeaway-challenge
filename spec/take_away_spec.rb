require 'take_away'

describe TakeAway do

subject(:take_away) { described_class.new(menu: menu, order: order) }
let(:order) { double(:order, total: 10.50) }
let(:menu) { double(:menu, print_this: printed_menu) }
let(:printed_menu) { "Fries: 5£" }
let(:dishes) do
{
  chicken: 3,
}


end

  it "prints the menu" do
    expect(take_away.print_menu).to eq(printed_menu)
  end

  it 'selects some number of available dishes' do
    expect(order).to receive(:add).once
    take_away.place_order(dishes)
  end

  it 'knows the order total' do
    allow(order).to receive(:add).once
    total = take_away.place_order(dishes)
    expect(total).to eq(10.50)
  end

end
