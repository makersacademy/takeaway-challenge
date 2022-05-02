require 'takeaway'

describe TakeAway do
  
  subject(:takeaway) { described_class.new(menu: menu, order: order) }
  
  let(:menu) {double(:menu, print: printed_menu)}
  let(:order) {double(:order)}

  let(:printed_menu) { "Prawn Toast: £5.50"}
  
  let(:dishes) { {
    "Prawn Toast": 1,
    "Siu Mai": 2,
  } }

  it "can create an instance of itself" do
    expect(subject).to be_kind_of(TakeAway)
  end

  it "can print a list of dishes and prices" do
    expect(takeaway.view_menu).to eq (printed_menu)
  end

  it "can order some number of several available dishes" do
    allow(order).to receive(:add).twice
    expect(takeaway.place_order(dishes)).to eq(dishes)
  end

end