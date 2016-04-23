require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, order) }
  let(:menu) { double(:menu, read_menu: printed_menu, contains?: true) }
  let(:printed_menu) { "Chicken: £4.50\nPork: £5.50\nSteak: £9.30" }
  let(:order) { double(:order, new: nil)}
  
  before do
    allow(menu).to receive(:dishes).and_return( {
      "Chicken"=>4.5, "Pork"=>5.5, "Steak"=>9.3 } )
  end
  
  it "read the menu" do
    expect(takeaway.print_menu).to eq printed_menu
  end
  
  xit "selects some number of several available dishes" do
    allow(order).to receive(:add)
    expect(takeaway.select_dish("Chicken", 3)).to eq 3
  end
  
  xit "raise error if selected dish is not available" do
    expect { takeaway.select_dish("Fish", 3) }.to raise_error takeaway::ERR_INVALID_ORDER
  end
end