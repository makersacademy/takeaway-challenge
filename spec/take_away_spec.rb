require "take_away"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) } 

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order)}
  let(:printed_menu) { 'Pizza: £5.99' }

  it 'prints menu with dish and price' do

    expect(takeaway.print_menu).to eq(printed_menu)
  end

  it 'can order some number of dishes' do
    
    expect(takeaway.place_order(dishes)).to eq("The total is £10")
  end
end
