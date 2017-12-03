require_relative "../lib/takeaway.rb"

describe TakeAway do

  subject(:takeaway) {described_class.new}
  let(:menu) {Menu.new}


  it "should display the menu" do
    expect(subject).to respond_to(:view_menu)
  end

  it "should list all the items in the menu" do
    expect(takeaway.view_menu).to eq "Chicken £3.78 | Pasta £4.59 | Salad £2.86"
  end

end
