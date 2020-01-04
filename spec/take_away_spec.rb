require "take_away"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { 'Pizza: £5.99' }

  it 'prints menu with dish and price' do

    expect(takeaway.print_menu).to eq(printed_menu)
  end
end
