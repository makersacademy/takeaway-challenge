require 'takeaway'
=begin
describe "Takeaway" do
subject(:takeaway) { Takeaway.new(menu: menu) }
let(:menu) {double :menu, print_menu: nil}


  it "should send menu a print_menu message" do
    subject.get_menu
    expect(menu).to have_received(:print_menu)
  end
end
=end

describe "Takeaway" do

subject(:takeaway) { Takeaway.new(menu) }
let(:menu) { double :menu, print_menu: nil }

  it "should print a menu" do
    subject.get_menu
    expect(menu).to have_received(:print_menu)
  end


end
