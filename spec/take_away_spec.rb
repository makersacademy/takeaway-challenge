require 'take_away'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { duble(:menu, print: printed_menu) }
  let(:printed_menu) { "pasta:  10£" }
  it "show the menu" do
    expect(subject.print_menu).to eq("print_menu")
  end
end
