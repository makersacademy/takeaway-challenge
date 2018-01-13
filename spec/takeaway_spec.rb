require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu) }

  it 'shows a list of dishes with prices' do
    expect(takeaway.show_menu).to eq("mushroom steamed buns: £4.00")
  end

end
