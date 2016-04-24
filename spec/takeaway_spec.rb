require "takeaway"

describe Takeaway do

  subject(:takeaway)  { described_class.new(menu: menu) }

  let(:menu)          { double(:menu, show: shows_menu) }
  let(:shows_menu)    { "The menu is..." }

  it "shows a list of dishes with prices" do
    expect(takeaway.show_menu).to eq shows_menu
  end
end