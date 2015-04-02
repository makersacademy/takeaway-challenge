require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu, view: "Cod £4\nSausage £3\nChips £2\n" }
  let(:takeaway) { described_class.new menu }
  menu_expect = "Cod £4\nSausage £3\nChips £2\n"

  it 'has a menu' do
    expect(takeaway.show_menu).to eq menu_expect
  end
end
