require 'take_away'

describe TakeAway do

subject(:take_away) { described_class.new(menu: menu, order: order) }
let(:order) { double(:order) }
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


end
