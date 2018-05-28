require 'Takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double :menu, print: printed_menu }
  let(:printed_menu) { "Menu List"}

  it 'shows a menu of dishes and prices' do
    expect(takeaway.print_menu).to eq(printed_menu)
  end

end
