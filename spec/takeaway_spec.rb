require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print_menu: shown_menu) }
  let(:shown_menu) { "menu items" }

  it "shows the menu" do
    expect(takeaway.show_menu).to eq(shown_menu)
  end
end
