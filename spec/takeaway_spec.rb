require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double(:menu, print_format: print_format) }
  let(:print_format) { "pizza: 4" }

  it "shows menu with price" do
    expect(takeaway.print_menu).to eq(print_format)
  end
end
