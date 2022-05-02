require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) {double(:menu, print: printed_menu)}
  let(:printed_menu) { "Prawn Toast: £5.50"}

  it "can create an instance of itself" do
    expect(subject).to be_kind_of(TakeAway)
  end

  it "can print a list of dishes and prices" do
    expect(takeaway.view_menu).to eq (printed_menu)
  end

end