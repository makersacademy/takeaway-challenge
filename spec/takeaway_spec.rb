require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu: menu)}
  let(:menu) {double(:menu, print_menu: dishes)}
  let(:dishes) {"Katsu chicken wrap: £4.50" }

  it 'shows the menu: name of dish and price' do
    expect(takeaway.show_menu).to eq dishes
  end
end
