require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Hawaiian: £9.99" }

  it 'should show a menu with dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
end
