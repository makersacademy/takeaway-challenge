require 'takeaway'
require 'menu'

describe Takeaway do
  # subject(:takeaway) {described_class.new}
  let (:menu) { double(:menu, print_menu: printed_menu) }

  let (:printed_menu) { "Chicken: £5" }
    
  it "initializes with an empty basket" do
    expect(subject).to have_attributes(basket: {})
  end    

  it 'prints the menu' do
    # menu.add_dish("chicken", 5)
    expect(subject.print_menu).to eq(printed_menu)
  end


end 