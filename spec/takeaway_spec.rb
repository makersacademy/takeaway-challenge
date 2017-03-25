require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu: menu)}
  let(:menu) {double(:menu, show_menu: food)}
  let(:food) {"Katsu chicken wrap: £4.50" }

  it 'shows the menu: name of dish and price' do
    expect(takeaway.print_menu).to eq(food)
  end
end
