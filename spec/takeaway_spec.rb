require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu) }

  let(:menu) { double(:menu, print: printed_menu)}
  let(:printed_menu) { "Chicken fried rice: £3.50" }


  it 'shows menu with dishes with prices' do
    expect(takeaway.list_menu).to eq(printed_menu)
  end

end