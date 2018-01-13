require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, show: showed_menu) }
  let(:showed_menu) { "pierogi: £4.00" }

  it 'shows a list of dishes with prices' do
    expect(takeaway.show_menu).to eq(showed_menu)
  end

end
