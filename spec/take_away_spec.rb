require "take_away"

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it "shows the menus with prices" do
    expect(takeaway.print_menu).to eq("List")
  end
end