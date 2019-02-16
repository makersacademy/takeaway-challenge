require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, show: show_menu) }
  let(:show_menu) { "Vindaloo: £6" }

  it "shows a list of dishes with prices" do
    expect(takeaway.read_menu).to eq(show_menu)
  end
end
