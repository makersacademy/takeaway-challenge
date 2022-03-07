require './lib/takeaway.rb'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu: menu)}

  let(:menu) { double(:menu, print: print_menu) }
  let(:order) { double(:order) }
  let(:print_menu) {'Steak frites: £10'}
  let(:dishes) { {steak: 10, chicken: 5} }

  it "shows a list of dishes and prices" do
    expect(takeaway.print_menu).to eq(print_menu)
  end

  it 'can order a number of several dishes' do
    expect(order).to receive(:add).twice
    expect(takeaway.place_order(dishes)).to eq('Your order comes to £15')
  end
end