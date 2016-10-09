require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Lasagne: £4.5"}

  it 'returns the items in the menu' do
    expect(subject.print_menu).to eq(printed_menu)
  end
end
