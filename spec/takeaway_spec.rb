require 'takeaway'

describe Takeaway do

  subject { Takeaway.new }
  let(:menu) { Menu.new }
  it "is expected to have a menu" do
    expect(subject.view_menu).to eq(menu.view_all)
  end

  it "should allow customers to order multiple dishes" do
    subject.place_order()
    subject.place_order()
    expect(subject.place_order(1)).to eq("Curry")
  end
end
