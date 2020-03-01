require "take_away"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu) }

  it "shows the menus with prices" do
    expect(takeaway.print_menu).to eq("List")
  end
end