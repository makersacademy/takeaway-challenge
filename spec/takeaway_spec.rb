require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu)         { double(:menu, show: show_menu) }
  let(:show_menu)    {'All the dishes'}

  it 'so a customer can see a list of dishes, it has a menu including those dishes' do
    expect(takeaway.show_menu).to eq(show_menu)
  end

end
