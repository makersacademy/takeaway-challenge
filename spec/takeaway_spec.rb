require 'takeaway'

describe Takeaway do

  #instantiates the takeaway, and initalizes it with a menu arguement
  subject(:takeaway) { described_class.new(menu: menu) }
  #bring in an empty box, call it 'menu', give in the method print, with menu_example as arguement
  let(:menu) { double(:menu, print: menu_example) }
  #menu example = "Rice £5"
  let (:menu_example) { "Rice £5"}

  it "displays menu" do
    expect(takeaway.print_menu).to eq("Rice £5")
  end


end
