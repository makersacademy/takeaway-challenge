require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, display: displayed_menu) }
  let(:displayed_menu) {"Arepa: £5.50"}

  it "displays menu and prices" do
    expect(takeaway.menu_display).to eq(displayed_menu)
  end

end
