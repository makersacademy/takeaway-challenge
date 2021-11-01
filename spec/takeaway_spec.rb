require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }  

  let(:menu) { double(:menu, print: displayed_menu) }
  let(:displayed_menu) { "Pizza: £2.00"}
  it "displays menu with prices of dishes" do
    expect(takeaway.display_menu).to eq(displayed_menu)
  end     
end    