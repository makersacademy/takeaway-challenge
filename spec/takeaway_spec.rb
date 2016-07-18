require 'takeaway'

describe Takeaway do
subject (:takeaway) {described_class.new(menu: menu) }

let(:menu) {double(:menu, print: printed_menu) }
let(:printed_menu) { "Beef £3.00" }



  it "shows the meny with the dishes" do
    expect(takeaway.print_menu).to eq(printed_menu)
  end
end
