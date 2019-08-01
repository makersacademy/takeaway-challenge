require 'takeaway'

describe Takeaway do
subject { described_class.new(menu: menu) }
#the above is because we've decided that it will be menu thats responsible for this, so we want to call print_menu on menu
let(:menu) { double(:menu, print: printed_menu) }
let(:printed_menu) { "Sweets: £1" }

  it "shows a list of dishes and prices" do
    expect(subject.print_menu).to eq "Sweets: £1"

  end

end
