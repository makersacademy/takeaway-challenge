require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Noodles: £4.00" }

  it 'shows menu with dishes and there prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
end