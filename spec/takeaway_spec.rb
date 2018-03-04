require 'takeaway'
describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "pasta: £4.30" }
  it 'shows the menu with the dishes and pices' do
    expect(subject.print_menu).to eq(printed_menu)
  end
end
