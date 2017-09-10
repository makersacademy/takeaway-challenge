require 'takeaway'

describe Takeaway do
subject(:takeaway) { described_class.new(menu: menu) } # every time you refer to subject, this calls a new takeaway class

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Menu List" }

  it "shows the menu of dishes with prices" do
    expect(menu.print).to eq(printed_menu)
  end

end
